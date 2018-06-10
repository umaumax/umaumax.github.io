# clang-libtooling tutorial
[Tutorial for building tools using LibTooling and LibASTMatchers — Clang 7 documentation]( http://clang.llvm.org/docs/LibASTMatchersTutorial.html )

[loop-cdetector.cpp]
```c++
// Declares clang::SyntaxOnlyAction.
#include "clang/Frontend/FrontendActions.h"
#include "clang/Tooling/CommonOptionsParser.h"
#include "clang/Tooling/Tooling.h"
// Declares llvm::cl::extrahelp.
#include "llvm/Support/CommandLine.h"

using namespace clang::tooling;
using namespace llvm;

#include "clang/ASTMatchers/ASTMatchFinder.h"
#include "clang/ASTMatchers/ASTMatchers.h"

using namespace clang;
using namespace clang::ast_matchers;

StatementMatcher LoopMatcher = forStmt(hasLoopInit(declStmt(hasSingleDecl(varDecl(hasInitializer(integerLiteral(equals(0)))))))).bind("forLoop");

class LoopPrinter : public MatchFinder::MatchCallback {
 public:
  virtual void run(const MatchFinder::MatchResult &Result) {
    if (const ForStmt *FS = Result.Nodes.getNodeAs<clang::ForStmt>("forLoop")) FS->dump();
  }
};

// Apply a custom category to all command-line options so that they are the
// only ones displayed.
static llvm::cl::OptionCategory MyToolCategory("my-tool options");

// CommonOptionsParser declares HelpMessage with a description of the common
// command-line options related to the compilation database and input files.
// It's nice to have this help message in all tools.
static cl::extrahelp CommonHelp(CommonOptionsParser::HelpMessage);

// A help message for this specific tool can be added afterwards.
static cl::extrahelp MoreHelp("\nMore help text...");

int main(int argc, const char **argv) {
  CommonOptionsParser OptionsParser(argc, argv, MyToolCategory);
  ClangTool Tool(OptionsParser.getCompilations(), OptionsParser.getSourcePathList());

  LoopPrinter Printer;
  MatchFinder Finder;
  Finder.addMatcher(LoopMatcher, &Printer);

  return Tool.run(newFrontendActionFactory(&Finder).get());
}
```

[build-clang-tools.sh]
```sh
#!/usr/bin/env bash
clang++ $@ \
	$(llvm-config --cxxflags) \
	$(llvm-config --ldflags --libs --system-libs) \
	-lclang \
	-lclangAST \
	-lclangASTMatchers \
	-lclangAnalysis \
	-lclangBasic \
	-lclangDriver \
	-lclangEdit \
	-lclangFrontend \
	-lclangFrontendTool \
	-lclangLex \
	-lclangParse \
	-lclangSema \
	-lclangEdit \
	-lclangRewrite \
	-lclangRewriteFrontend \
	-lclangStaticAnalyzerFrontend \
	-lclangStaticAnalyzerCheckers \
	-lclangStaticAnalyzerCore \
	-lclangSerialization \
	-lclangToolingCore \
	-lclangTooling \
	-lclangFormat
```

```
./build-clang-tools.sh build-loop-cdetector
```

[test.cpp]
```cpp
#include <iostream>
class Y {
 public:
  void doSomething();
};

void z() {
  Y y;
  y.doSomething();
}

int doSomething(int i) {
  if (i == 0) return 0;
  return 1 + doSomething(i--);
}

int main() {
  for (int i = 0; i < 10; i++) {
    std::cout << "hello world" << std::endl;
  }
  return doSomething(2);
}
```

[run]
```
./loop-detector hello.cpp -- -std=c++11 -I/usr/local/Cellar/llvm/6.0.0/include/c++/v1 -I/usr/local/include -I/usr/local/Cellar/llvm/6.0.0/lib/clang/6.0.0/include -I/usr/include
```
※ インクルードヘッダは`clang++ -v`で確認すると良い
