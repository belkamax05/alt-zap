var __create = Object.create;
var __defProp = Object.defineProperty;
var __getOwnPropDesc = Object.getOwnPropertyDescriptor;
var __getOwnPropNames = Object.getOwnPropertyNames;
var __getProtoOf = Object.getPrototypeOf;
var __hasOwnProp = Object.prototype.hasOwnProperty;
var __glob = (map) => (path3) => {
  var fn = map[path3];
  if (fn)
    return fn();
  throw new Error("Module not found in bundle: " + path3);
};
var __esm = (fn, res) => function __init() {
  return fn && (res = (0, fn[__getOwnPropNames(fn)[0]])(fn = 0)), res;
};
var __export = (target, all) => {
  for (var name in all)
    __defProp(target, name, { get: all[name], enumerable: true });
};
var __copyProps = (to, from, except, desc) => {
  if (from && typeof from === "object" || typeof from === "function") {
    for (let key of __getOwnPropNames(from))
      if (!__hasOwnProp.call(to, key) && key !== except)
        __defProp(to, key, { get: () => from[key], enumerable: !(desc = __getOwnPropDesc(from, key)) || desc.enumerable });
  }
  return to;
};
var __toESM = (mod, isNodeMode, target) => (target = mod != null ? __create(__getProtoOf(mod)) : {}, __copyProps(
  // If the importer is in node compatibility mode or this is not an ESM
  // file that has been converted to a CommonJS file using a Babel-
  // compatible transform (i.e. "__esModule" has not been set), then set
  // "default" to the CommonJS "module.exports" for node compatibility.
  isNodeMode || !mod || !mod.__esModule ? __defProp(target, "default", { value: mod, enumerable: true }) : target,
  mod
));

// libs/utils/src/config/defaultConfig.ts
var defaultConfig, defaultConfig_default;
var init_defaultConfig = __esm({
  "libs/utils/src/config/defaultConfig.ts"() {
    defaultConfig = {
      debug: false,
      debugCommandHeader: true
    };
    defaultConfig_default = defaultConfig;
  }
});

// libs/utils/src/config/mergeConfigs.ts
var import_merge, mergeConfigs, mergeConfigs_default;
var init_mergeConfigs = __esm({
  "libs/utils/src/config/mergeConfigs.ts"() {
    import_merge = __toESM(require("lodash/merge"));
    mergeConfigs = (config1, config2) => (0, import_merge.default)(config1, config2);
    mergeConfigs_default = mergeConfigs;
  }
});

// libs/utils/src/config/getUserConfig.ts
var import_fs, import_cloneDeep, import_path, getUserConfig, getUserConfig_default;
var init_getUserConfig = __esm({
  "libs/utils/src/config/getUserConfig.ts"() {
    import_fs = __toESM(require("fs"));
    import_cloneDeep = __toESM(require("lodash/cloneDeep"));
    import_path = __toESM(require("path"));
    init_defaultConfig();
    init_mergeConfigs();
    getUserConfig = ({ configPath }) => {
      const userConfigPath = configPath.endsWith(".json") ? configPath : import_path.default.join(configPath, "user-config.json");
      const userConfigFile = import_fs.default.readFileSync(userConfigPath, "utf8");
      const userConfigJson = JSON.parse(userConfigFile);
      const mergedConfig = mergeConfigs_default((0, import_cloneDeep.default)(defaultConfig_default), userConfigJson);
      return mergedConfig;
    };
    getUserConfig_default = getUserConfig;
  }
});

// apps/cli/src/utils/satisfiesLegacy.ts
var satisfiesLegacy, satisfiesLegacy_default;
var init_satisfiesLegacy = __esm({
  "apps/cli/src/utils/satisfiesLegacy.ts"() {
    satisfiesLegacy = (config, _validator) => {
      return config;
    };
    satisfiesLegacy_default = satisfiesLegacy;
  }
});

// apps/cli/src/config/alias.ts
var alias, alias_default;
var init_alias = __esm({
  "apps/cli/src/config/alias.ts"() {
    init_satisfiesLegacy();
    alias = satisfiesLegacy_default(
      {
        //? az
        install: "az/install",
        //? config
        initialise: "config/initialise",
        init: "config/initialise",
        get: "config/get",
        ["config-get"]: "config/get",
        set: "config/set",
        ["config-set"]: "config/set",
        //? fe
        npkill: "fe/npkill",
        //? git
        push: "git/push",
        pull: "git/pull",
        commit: "git/commit",
        changes: "git/changes",
        //? sample
        ["colors-true"]: "sample/colors-true",
        delayed: "sample/delayed",
        dialogs: "sample/dialogs",
        lorem: "sample/lorem",
        hello: "sample/hello",
        nested: "sample/nested",
        //? system
        envs: "system/envs",
        poweroff: "system/poweroff",
        //? terminal
        here: "terminal/here",
        load: "terminal/load",
        reload: "terminal/reload",
        restart: "terminal/restart",
        up: "terminal/up"
      },
      null
    );
    alias_default = alias;
  }
});

// apps/cli/src/types/error/CommandImportError.ts
var CommandImportError, CommandImportError_default;
var init_CommandImportError = __esm({
  "apps/cli/src/types/error/CommandImportError.ts"() {
    CommandImportError = class extends Error {
      constructor(command) {
        super(`Error importing command: ${command}`);
        this.name = "CommandImportError";
      }
    };
    CommandImportError_default = CommandImportError;
  }
});

// apps/cli/src/utils/logCommand.ts
var logCommand, logCommand_default;
var init_logCommand = __esm({
  "apps/cli/src/utils/logCommand.ts"() {
    logCommand = (text2) => console.log(`> ${text2}`);
    logCommand_default = logCommand;
  }
});

// apps/cli/src/commands/build.ts
var build_exports = {};
__export(build_exports, {
  default: () => build_default
});
var build, build_default;
var init_build = __esm({
  "apps/cli/src/commands/build.ts"() {
    init_logCommand();
    build = () => {
      logCommand_default("az cli-build");
    };
    build_default = build;
  }
});

// apps/cli/src/commands/config/convert-to-zsh.ts
var convert_to_zsh_exports = {};
__export(convert_to_zsh_exports, {
  default: () => convert_to_zsh_default
});
var import_fs2, convertToZsh, convert_to_zsh_default;
var init_convert_to_zsh = __esm({
  "apps/cli/src/commands/config/convert-to-zsh.ts"() {
    import_fs2 = __toESM(require("fs"), 1);
    convertToZsh = async ({ program }) => {
      const { debug, debugCommandHeader, ..._rest } = program.userConfig;
      const configBody = `
  AZ_DEBUG=${debug ? 1 : 0}
  AZ_DEBUG_COMMAND_HEADER=${debugCommandHeader ? 1 : 0}
  `;
      const normalizedConfigBody = configBody.trim().split("\n").map((item) => item.trim()).join("\n");
      import_fs2.default.writeFileSync(
        program.env.AZ_CONFIG_DIR + "/user-config.zsh",
        normalizedConfigBody
      );
    };
    convert_to_zsh_default = convertToZsh;
  }
});

// apps/cli/src/commands/config/initialise.ts
var initialise_exports = {};
__export(initialise_exports, {
  default: () => initialise_default
});
var import_prompts2, import_fs3, initialise, initialise_default;
var init_initialise = __esm({
  "apps/cli/src/commands/config/initialise.ts"() {
    import_prompts2 = require("@clack/prompts");
    import_fs3 = __toESM(require("fs"), 1);
    initialise = async ({ command }) => {
      const chalk = require("chalk");
      import_prompts2.log.step(`Initialising configuration`);
      const { force: _force, f: _f } = command.args;
      const force = _force || _f;
      const { AZ_CONFIG_DIR: configDir } = process.env;
      const configFilePath = `${configDir}/config.json`;
      if (!import_fs3.default.existsSync(configDir)) {
        import_prompts2.log.info(`Creating configuration directory ${configDir}`);
        import_fs3.default.mkdirSync(configDir, { recursive: true });
      }
      if (force || !import_fs3.default.existsSync(configFilePath)) {
        import_prompts2.log.info(`Creating configuration file '${chalk.cyan(configFilePath)}'`);
        import_fs3.default.writeFileSync(configFilePath, JSON.stringify({ temp: true }, null, 2));
      }
    };
    initialise_default = initialise;
  }
});

// apps/cli/src/commands/config/print.ts
var print_exports = {};
__export(print_exports, {
  default: () => print_default
});
var print, print_default;
var init_print = __esm({
  "apps/cli/src/commands/config/print.ts"() {
    init_getUserConfig();
    print = async ({ program }) => {
      const userConfig = getUserConfig_default({ configPath: program.env.AZ_CONFIG_DIR });
      console.log(userConfig);
    };
    print_default = print;
  }
});

// apps/cli/src/commands/config/set.ts
var set_exports = {};
__export(set_exports, {
  default: () => set_default
});
var import_fs4, import_cloneDeep2, import_path2, booleanParse, set, set_default;
var init_set = __esm({
  "apps/cli/src/commands/config/set.ts"() {
    init_defaultConfig();
    init_mergeConfigs();
    import_fs4 = __toESM(require("fs"), 1);
    import_cloneDeep2 = __toESM(require("lodash/cloneDeep"), 1);
    import_path2 = __toESM(require("path"), 1);
    init_CommandInstance();
    booleanParse = (value) => {
      if (value === "true")
        return true;
      if (value === "false")
        return false;
      return Boolean(value);
    };
    set = async ({ program, context }) => {
      const currentConfig = program.userConfig;
      const [_, propName, propValue] = program.args._;
      const updatesInConfig = {};
      if (propName && propValue) {
        const defaultValue = defaultConfig_default[propName];
        const fixedValue = typeof defaultValue === "boolean" ? booleanParse(propValue) : propValue;
        console.log({ propValue, defaultValue, fixedValue });
        updatesInConfig[propName] = fixedValue;
      }
      const newConfig = mergeConfigs_default((0, import_cloneDeep2.default)(currentConfig), updatesInConfig);
      if (JSON.stringify(currentConfig) !== JSON.stringify(newConfig)) {
        program.userConfig = newConfig;
        await import_fs4.default.promises.writeFile(
          import_path2.default.join(program.env.AZ_CONFIG_DIR, "user-config.json"),
          JSON.stringify(newConfig, null, 2)
        );
        context.addCommand(new CommandInstance_default(["config/convert-to-zsh"]));
      }
    };
    set_default = set;
  }
});

// apps/cli/src/commands/debug/error.ts
var error_exports = {};
__export(error_exports, {
  default: () => error_default
});
var debugError, error_default;
var init_error = __esm({
  "apps/cli/src/commands/debug/error.ts"() {
    debugError = () => {
      console.log(
        "Error should be thrown and come back to cli execution with error"
      );
      throw new Error("Debug error");
    };
    error_default = debugError;
  }
});

// apps/cli/src/commands/demo/context.ts
var context_exports = {};
__export(context_exports, {
  default: () => context_default
});
var demoContext, context_default;
var init_context = __esm({
  "apps/cli/src/commands/demo/context.ts"() {
    init_CommandInstance();
    demoContext = async ({ command, program, context }) => {
      console.log("!!! demo context command runs");
      context.addCommand(new CommandInstance_default(["hello"]));
      await context.instantCommand(new CommandInstance_default(["hello"]));
      context.addCommand(new CommandInstance_default(["hello"]));
      console.log("!!! demo context command ends");
    };
    context_default = demoContext;
  }
});

// apps/cli/src/commands/fe/npkill.ts
var npkill_exports = {};
__export(npkill_exports, {
  default: () => npkill_default
});
var npkill, npkill_default;
var init_npkill = __esm({
  "apps/cli/src/commands/fe/npkill.ts"() {
    init_logCommand();
    npkill = () => {
      logCommand_default("yarn dlx npkill");
    };
    npkill_default = npkill;
  }
});

// libs/utils/src/exec/execAsync.ts
var import_child_process, import_util, execAsync, execAsync_default;
var init_execAsync = __esm({
  "libs/utils/src/exec/execAsync.ts"() {
    import_child_process = require("child_process");
    import_util = require("util");
    execAsync = (0, import_util.promisify)(import_child_process.exec);
    execAsync_default = execAsync;
  }
});

// libs/utils/src/helpers/string/quanitityOfCharacter.ts
var quantityOfCharacter, quanitityOfCharacter_default;
var init_quanitityOfCharacter = __esm({
  "libs/utils/src/helpers/string/quanitityOfCharacter.ts"() {
    quantityOfCharacter = (searchStr, char) => {
      const res = searchStr.split(char).length - 1;
      return res;
    };
    quanitityOfCharacter_default = quantityOfCharacter;
  }
});

// libs/utils/src/git/isBranchNameFlow.ts
var isBranchNameFlow, isBranchNameFlow_default;
var init_isBranchNameFlow = __esm({
  "libs/utils/src/git/isBranchNameFlow.ts"() {
    init_quanitityOfCharacter();
    isBranchNameFlow = (name) => {
      const slashCount = quanitityOfCharacter_default(name, "/");
      return slashCount > 1;
    };
    isBranchNameFlow_default = isBranchNameFlow;
  }
});

// libs/utils/src/git/getFlowParams.ts
var getFlowParams, getFlowParams_default;
var init_getFlowParams = __esm({
  "libs/utils/src/git/getFlowParams.ts"() {
    init_isBranchNameFlow();
    getFlowParams = (branchName) => {
      const isFlowBranch = isBranchNameFlow_default(branchName);
      const [flowCategory, flowTicket, flowName] = isFlowBranch ? branchName.split("/") : [];
      return {
        flowCategory,
        flowTicket,
        flowName
      };
    };
    getFlowParams_default = getFlowParams;
  }
});

// libs/utils/src/git/getBranchDescription.ts
var getBranchDescription, getBranchDescription_default;
var init_getBranchDescription = __esm({
  "libs/utils/src/git/getBranchDescription.ts"() {
    init_execAsync();
    init_getFlowParams();
    init_isBranchNameFlow();
    getBranchDescription = async () => {
      const { stdout } = await execAsync_default("git branch --show-current");
      const name = stdout.trim();
      const isFlow = isBranchNameFlow_default(name);
      const flow = isFlow ? getFlowParams_default(name) : null;
      const ticketNumber = flow?.flowTicket?.toUpperCase();
      return {
        name,
        isFlow,
        flow,
        ticketNumber
      };
    };
    getBranchDescription_default = getBranchDescription;
  }
});

// apps/cli/src/commands/git/about.ts
var about_exports = {};
__export(about_exports, {
  default: () => about_default
});
var about, about_default;
var init_about = __esm({
  "apps/cli/src/commands/git/about.ts"() {
    init_getBranchDescription();
    about = async () => {
      try {
        const { name, isFlow, ...rest } = await getBranchDescription_default();
        console.log({ name, isFlow, ...rest });
      } catch (error) {
        console.error("Error fetching current branch:", error);
      }
    };
    about_default = about;
  }
});

// libs/utils/src/git/getFilesDiff.ts
var getFilesDiff, getFilesDiff_default;
var init_getFilesDiff = __esm({
  "libs/utils/src/git/getFilesDiff.ts"() {
    init_execAsync();
    getFilesDiff = async ({
      cached,
      removed,
      diffFilter
    }) => {
      const cachedStr = cached ? " --cached" : "";
      const removedStr = removed ? " --diff-filter=D" : diffFilter ? ` --diff-filter=${diffFilter}` : "";
      const { stdout } = await execAsync_default(
        `git diff --name-only ${removedStr}${cachedStr}`
      );
      return stdout.trim().split("\n").filter(Boolean);
    };
    getFilesDiff_default = getFilesDiff;
  }
});

// libs/utils/src/helpers/format/formatCommand.ts
var import_colors, formatCommand, formatCommand_default;
var init_formatCommand = __esm({
  "libs/utils/src/helpers/format/formatCommand.ts"() {
    import_colors = __toESM(require("colors"));
    formatCommand = (command) => import_colors.default.yellow(command);
    formatCommand_default = formatCommand;
  }
});

// libs/utils/src/helpers/format/formatNumber.ts
var import_colors2, formatNumber, formatNumber_default;
var init_formatNumber = __esm({
  "libs/utils/src/helpers/format/formatNumber.ts"() {
    import_colors2 = __toESM(require("colors"));
    formatNumber = (number) => import_colors2.default.cyan(String(number));
    formatNumber_default = formatNumber;
  }
});

// apps/cli/src/commands/git/changes.ts
var changes_exports = {};
__export(changes_exports, {
  default: () => changes_default
});
var import_prompts3, printFor, changes, changes_default;
var init_changes = __esm({
  "apps/cli/src/commands/git/changes.ts"() {
    init_getFilesDiff();
    init_formatCommand();
    init_formatNumber();
    import_prompts3 = require("@clack/prompts");
    printFor = async ({ cached, removed }) => {
      const which = `${cached === true ? "staged" : cached === false ? "unstaged" : ""}${removed ? " removed" : ""}`;
      const files = await getFilesDiff_default({ cached, removed });
      if (files.length === 0) {
        import_prompts3.log.info(`No ${which} files found`);
        return;
      }
      import_prompts3.log.info(
        `Total ${formatNumber_default(files.length)} ${formatCommand_default(which)} files:`
      );
      import_prompts3.log.message(files.map((file) => `- ${file}`).join("\n"));
    };
    changes = async ({ command }) => {
      const { args } = command;
      const cached = (() => {
        if (["--staged", "--cached"].map((arg) => args.includes(arg)).some(Boolean))
          return true;
        if (["--unstaged", "--uncached", "--not-staged", "--not-cached"].map((arg) => args.includes(arg)).some(Boolean))
          return false;
        return null;
      })();
      const removed = (() => {
        if (["--removed", "--deleted"].map((arg) => args.includes(arg)).some(Boolean))
          return true;
        if (["--unremoved", "--undeleted", "--not-removed", "--not-deleted"].map((arg) => args.includes(arg)).some(Boolean))
          return false;
        return null;
      })();
      if (cached === null) {
        await printFor({ cached: true, removed });
        await printFor({ cached: false, removed });
        return;
      }
      await printFor({ cached, removed });
    };
    changes_default = changes;
  }
});

// libs/utils/src/git/execCommit.ts
var execCommit, execCommit_default;
var init_execCommit = __esm({
  "libs/utils/src/git/execCommit.ts"() {
    init_execAsync();
    execCommit = async ({ message }) => {
      return await execAsync_default(`git commit -m '${message}'`);
    };
    execCommit_default = execCommit;
  }
});

// libs/utils/src/git/format/formatFilesList.ts
var formatFilesList, formatFilesList_default;
var init_formatFilesList = __esm({
  "libs/utils/src/git/format/formatFilesList.ts"() {
    formatFilesList = (files) => files.map((file) => `- ${file}`).join("\n");
    formatFilesList_default = formatFilesList;
  }
});

// libs/utils/src/git/getAllUnstagedFiles.ts
var getAllUnstagedFiles, getAllUnstagedFiles_default;
var init_getAllUnstagedFiles = __esm({
  "libs/utils/src/git/getAllUnstagedFiles.ts"() {
    getAllUnstagedFiles = () => {
      const { exec: exec2 } = require("child_process");
      return new Promise((resolve, reject) => {
        exec2(
          "git ls-files --others --exclude-standard",
          (error, stdoutUntracked) => {
            if (error) {
              reject(error);
              return;
            }
            exec2("git diff --name-only", (error2, stdoutModified) => {
              if (error2) {
                reject(error2);
                return;
              }
              exec2(
                "git diff --name-only --cached",
                (error3, stdoutStaged) => {
                  if (error3) {
                    reject(error3);
                    return;
                  }
                  const files = [
                    ...stdoutUntracked.split("\n").filter((line) => line && !line.endsWith("/")),
                    ...stdoutModified.split("\n").filter((line) => line && !line.endsWith("/")),
                    ...stdoutStaged.split("\n").filter((line) => line && !line.endsWith("/"))
                  ];
                  resolve(files);
                }
              );
            });
          }
        );
      });
    };
    getAllUnstagedFiles_default = getAllUnstagedFiles;
  }
});

// apps/cli/src/commands/git/commit.ts
var commit_exports = {};
__export(commit_exports, {
  default: () => commit_default
});
var import_prompts4, import_colors3, commit, commit_default;
var init_commit = __esm({
  "apps/cli/src/commands/git/commit.ts"() {
    init_execCommit();
    init_formatFilesList();
    init_getAllUnstagedFiles();
    init_getBranchDescription();
    init_getFilesDiff();
    init_formatCommand();
    import_prompts4 = require("@clack/prompts");
    import_colors3 = __toESM(require("colors"), 1);
    commit = async ({ command }) => {
      const _secParam = command.args._[1];
      const { message: _argsMessage, m: _argsM } = command.args;
      const argsMessage = _argsMessage || _argsM || _secParam;
      const stagedFiles = await getFilesDiff_default({ cached: true });
      if (stagedFiles.length === 0) {
        const unstagedFiles = await getAllUnstagedFiles_default();
        const unstagedLen = unstagedFiles.length;
        const unstagedMessage = unstagedLen > 0 ? ` ${import_colors3.default.yellow(String(unstagedLen))} Unstaged files detected.` : "";
        import_prompts4.log.info(`No staged files for commit.${unstagedMessage}`);
        return;
      }
      const { name, isFlow, flow, ticketNumber } = await getBranchDescription_default();
      import_prompts4.log.info(`Commit for branch '${formatCommand_default(name)}':`);
      import_prompts4.log.info("Staged files:");
      import_prompts4.log.message(formatFilesList_default(stagedFiles));
      const flowDetectedMessage = isFlow ? ` (${import_colors3.default.cyan("Flow")})` : "";
      const messageTitle = `Enter commit message for branch '${import_colors3.default.yellow(name)}'${flowDetectedMessage}:`;
      const flowPreffix = isFlow ? `${ticketNumber}: ${flow.flowCategory}: ` : "";
      const initialValue = isFlow ? flowPreffix : argsMessage || "";
      const placeholder = isFlow ? `${flowPreffix}<message>` : "<message>";
      const message = argsMessage || await (0, import_prompts4.text)({
        message: messageTitle,
        placeholder,
        initialValue
      });
      const canceled = (0, import_prompts4.isCancel)(message);
      if (canceled) {
        import_prompts4.log.info("Commit canceled.");
        return;
      }
      await execCommit_default({ message });
    };
    commit_default = commit;
  }
});

// apps/cli/src/commands/git/files-unstaged.ts
var files_unstaged_exports = {};
__export(files_unstaged_exports, {
  default: () => files_unstaged_default
});
var import_prompts5, filesUnstaged, files_unstaged_default;
var init_files_unstaged = __esm({
  "apps/cli/src/commands/git/files-unstaged.ts"() {
    init_getFilesDiff();
    import_prompts5 = require("@clack/prompts");
    filesUnstaged = async () => {
      const files = await getFilesDiff_default({});
      if (files.length === 0) {
        import_prompts5.log.info("No unstaged files found");
        return;
      }
      import_prompts5.log.info("Unstaged files:");
      import_prompts5.log.message(files.map((file) => `- ${file}`).join("\n"));
    };
    files_unstaged_default = filesUnstaged;
  }
});

// libs/utils/src/git/format/formatCommitsList.ts
var formatCommitsList, formatCommitsList_default;
var init_formatCommitsList = __esm({
  "libs/utils/src/git/format/formatCommitsList.ts"() {
    formatCommitsList = (commits) => commits.map(({ hash, message }) => `${hash} - ${message}`).join("\n");
    formatCommitsList_default = formatCommitsList;
  }
});

// libs/utils/src/git/getLocalCommits.ts
var getLocalCommits, getLocalCommits_default;
var init_getLocalCommits = __esm({
  "libs/utils/src/git/getLocalCommits.ts"() {
    init_execAsync();
    init_getBranchDescription();
    getLocalCommits = async (options) => {
      let { name } = options || {};
      if (!name) {
        const { name: branchDescriptionName } = await getBranchDescription_default();
        name = branchDescriptionName;
      }
      const commitsCmd = `git log ${name} --not --remotes --oneline`;
      const { stdout: commits } = await execAsync_default(commitsCmd);
      return commits.trim().split("\n").filter(Boolean).map((commit2) => {
        const [hash, message] = commit2.split(" ");
        return { hash, message };
      });
    };
    getLocalCommits_default = getLocalCommits;
  }
});

// apps/cli/src/commands/git/local-commits.ts
var local_commits_exports = {};
__export(local_commits_exports, {
  default: () => local_commits_default
});
var import_prompts6, localCommits, local_commits_default;
var init_local_commits = __esm({
  "apps/cli/src/commands/git/local-commits.ts"() {
    init_formatCommitsList();
    init_getLocalCommits();
    import_prompts6 = require("@clack/prompts");
    localCommits = async () => {
      const commits = await getLocalCommits_default();
      if (commits.length === 0) {
        import_prompts6.log.info("No local commits found");
        return;
      }
      import_prompts6.log.info("Local commits:");
      import_prompts6.log.message(formatCommitsList_default(commits));
    };
    local_commits_default = localCommits;
  }
});

// apps/cli/src/commands/git/pull.ts
var pull_exports = {};
__export(pull_exports, {
  default: () => pull_default
});
var import_child_process2, pull, pull_default;
var init_pull = __esm({
  "apps/cli/src/commands/git/pull.ts"() {
    import_child_process2 = require("child_process");
    pull = () => {
      (0, import_child_process2.spawn)("git", ["pull"], {
        stdio: "inherit",
        shell: true
      });
    };
    pull_default = pull;
  }
});

// apps/cli/src/commands/git/push.ts
var push_exports = {};
__export(push_exports, {
  default: () => push_default
});
var import_prompts7, import_colors4, push, push_default;
var init_push = __esm({
  "apps/cli/src/commands/git/push.ts"() {
    init_execAsync();
    init_formatCommitsList();
    init_getBranchDescription();
    init_getLocalCommits();
    import_prompts7 = require("@clack/prompts");
    import_colors4 = __toESM(require("colors"), 1);
    push = async () => {
      const { name: branchName } = await getBranchDescription_default();
      const commits = await getLocalCommits_default({ name: branchName });
      if (commits.length === 0) {
        import_prompts7.log.info(`No commits to push at branch '${import_colors4.default.yellow(branchName)}'`);
        return;
      }
      import_prompts7.log.info("Commits to be pushed:");
      import_prompts7.log.message(formatCommitsList_default(commits));
      const shouldPush = await (0, import_prompts7.confirm)({
        message: "Do you want to push these commits?",
        initialValue: false
      });
      if (shouldPush) {
        const { stderr: output } = await execAsync_default("git push");
        import_prompts7.log.info(output);
      }
    };
    push_default = push;
  }
});

// apps/cli/src/utils/wait.ts
var wait, wait_default;
var init_wait = __esm({
  "apps/cli/src/utils/wait.ts"() {
    wait = (ms) => new Promise((resolve) => setTimeout(resolve, ms));
    wait_default = wait;
  }
});

// apps/cli/src/commands/lab/lab.ts
var lab_exports = {};
__export(lab_exports, {
  default: () => lab_default
});
var lab, lab_default;
var init_lab = __esm({
  "apps/cli/src/commands/lab/lab.ts"() {
    init_logCommand();
    init_wait();
    lab = async () => {
      console.log("Lab command running A");
      await wait_default(1e3);
      console.log("Lab command running B");
      await wait_default(1e3);
      console.log("Lab command running C");
      await wait_default(1e3);
      console.log("Lab command running D");
      logCommand_default("cd .. && cd .. && az here");
    };
    lab_default = lab;
  }
});

// apps/cli/src/commands/sample/colors-true.ts
var colors_true_exports = {};
__export(colors_true_exports, {
  default: () => colors_true_default
});
var colorsTrue2, colors_true_default;
var init_colors_true = __esm({
  "apps/cli/src/commands/sample/colors-true.ts"() {
    colorsTrue2 = async () => {
      console.log("256 Colors Example:");
      for (let i = 0; i <= 255; i++) {
        process.stdout.write(`\x1B[38;5;${i}m${i} `);
        if ((i + 1) % 16 === 0) {
          console.log("\x1B[0m");
        }
      }
      console.log("\x1B[0m");
      console.log("True Color Example:");
      for (let r = 0; r <= 255; r += 51) {
        for (let g = 0; g <= 255; g += 51) {
          for (let b = 0; b <= 255; b += 51) {
            process.stdout.write(`\x1B[48;2;${r};${g};${b}m  `);
          }
          console.log("\x1B[0m");
        }
      }
    };
    colors_true_default = colorsTrue2;
  }
});

// apps/cli/src/commands/sample/delayed.ts
var delayed_exports = {};
__export(delayed_exports, {
  default: () => delayed_default
});
var delayed, delayed_default;
var init_delayed = __esm({
  "apps/cli/src/commands/sample/delayed.ts"() {
    init_logCommand();
    init_wait();
    delayed = async ({ command }) => {
      const silent = command.args.includes("--silent") || command.args.includes("-s");
      if (!silent)
        console.log("delayed command running A");
      await wait_default(1e3);
      logCommand_default('echo "Hello, World!"');
      logCommand_default("ls");
      await wait_default(400);
      process.stdout.write("3");
      await wait_default(400);
      process.stdout.write("2");
      await wait_default(400);
      process.stdout.write("1");
      await wait_default(400);
      process.stdout.write("...\n");
      logCommand_default('echo "Goodbye, World!"');
      logCommand_default("ls");
    };
    delayed_default = delayed;
  }
});

// apps/cli/src/commands/sample/dialogs.ts
var dialogs_exports = {};
__export(dialogs_exports, {
  default: () => dialogs_default
});
var import_prompts8, demoDialogs, dialogs_default;
var init_dialogs = __esm({
  "apps/cli/src/commands/sample/dialogs.ts"() {
    import_prompts8 = require("@clack/prompts");
    init_logCommand();
    demoDialogs = async () => {
      const commandToExecute = await (0, import_prompts8.multiselect)({
        message: "Select additional tools.",
        options: [
          { value: "ls", label: "Print ls", hint: "Print ls" },
          { value: "cd ..", label: 'Run "cd .."', hint: "Go up one folder" },
          { value: 'echo "Hello"', label: 'Echo "Hello"' }
        ],
        required: false
      });
      commandToExecute.forEach((command) => {
        console.log({ command });
        logCommand_default(command);
      });
    };
    dialogs_default = demoDialogs;
  }
});

// apps/cli/src/commands/sample/hello.ts
var hello_exports = {};
__export(hello_exports, {
  default: () => hello_default
});
var hello, hello_default;
var init_hello = __esm({
  "apps/cli/src/commands/sample/hello.ts"() {
    hello = () => {
      console.log("Hello, world!");
    };
    hello_default = hello;
  }
});

// apps/cli/src/commands/sample/lorem.ts
var lorem_exports = {};
__export(lorem_exports, {
  default: () => lorem_default
});
var lorem1, loremDefine, lorem, lorem_default;
var init_lorem = __esm({
  "apps/cli/src/commands/sample/lorem.ts"() {
    init_logCommand();
    lorem1 = "Lorem ipsum dolor sit amet, consectetur adipiscing elit";
    loremDefine = `export loremIpsum="${lorem1}"`;
    lorem = ({ command }) => {
      const [_effect] = command.args;
      const effect = _effect || "bouncyballs";
      logCommand_default(`${loremDefine}`);
      logCommand_default(`echo $loremIpsum | tte ${effect}`);
    };
    lorem_default = lorem;
  }
});

// apps/cli/src/commands/sample/nested.ts
var nested_exports = {};
__export(nested_exports, {
  default: () => nested_default
});
var sampleNested1, nested_default;
var init_nested = __esm({
  "apps/cli/src/commands/sample/nested.ts"() {
    sampleNested1 = ({ context }) => {
      context.addCommand("sample/nested1");
      context.addCommand("sample/nested2", ["again"]);
    };
    nested_default = sampleNested1;
  }
});

// apps/cli/src/commands/sample/nested1.ts
var nested1_exports = {};
__export(nested1_exports, {
  default: () => nested1_default
});
var sampleNested12, nested1_default;
var init_nested1 = __esm({
  "apps/cli/src/commands/sample/nested1.ts"() {
    sampleNested12 = ({ command }) => {
      console.log("Hello 1!", command);
    };
    nested1_default = sampleNested12;
  }
});

// apps/cli/src/commands/sample/nested2.ts
var nested2_exports = {};
__export(nested2_exports, {
  default: () => nested2_default
});
var sampleNested2, nested2_default;
var init_nested2 = __esm({
  "apps/cli/src/commands/sample/nested2.ts"() {
    sampleNested2 = ({ command }) => {
      console.log("Hello 2!", command);
    };
    nested2_default = sampleNested2;
  }
});

// apps/cli/src/commands/start.ts
var start_exports = {};
__export(start_exports, {
  default: () => start_default
});
var start, start_default;
var init_start = __esm({
  "apps/cli/src/commands/start.ts"() {
    init_logCommand();
    start = async () => {
      logCommand_default("yarn mock & yarn start");
    };
    start_default = start;
  }
});

// apps/cli/src/commands/system/envs.ts
var envs_exports = {};
__export(envs_exports, {
  default: () => envs_default
});
var envs, envs_default;
var init_envs = __esm({
  "apps/cli/src/commands/system/envs.ts"() {
    envs = async () => {
      console.log("Running print-envs");
      console.log(process.env);
    };
    envs_default = envs;
  }
});

// apps/cli/src/commands/system/poweroff.ts
var poweroff_exports = {};
__export(poweroff_exports, {
  default: () => poweroff_default
});
var import_child_process3, poweroff, poweroff_default;
var init_poweroff = __esm({
  "apps/cli/src/commands/system/poweroff.ts"() {
    import_child_process3 = require("child_process");
    poweroff = () => {
      console.log("process.platform", process.platform);
      if (process.platform === "darwin") {
        (0, import_child_process3.execSync)(`osascript -e 'tell application "System Events" to shut down'`);
      } else if (process.platform === "linux") {
      } else if (process.platform === "android") {
      } else {
        console.log("OS not supported");
      }
    };
    poweroff_default = poweroff;
  }
});

// apps/cli/src/commands/terminal/here.ts
var here_exports = {};
__export(here_exports, {
  default: () => here_default
});
var here, here_default;
var init_here = __esm({
  "apps/cli/src/commands/terminal/here.ts"() {
    init_logCommand();
    here = () => {
      logCommand_default(`cd ${process.env["AZ_DIR"]}`);
    };
    here_default = here;
  }
});

// apps/cli/src/commands/terminal/load.ts
var load_exports = {};
__export(load_exports, {
  default: () => load_default
});
var load, load_default;
var init_load = __esm({
  "apps/cli/src/commands/terminal/load.ts"() {
    init_logCommand();
    load = () => {
      logCommand_default("source ~/.zshrc");
    };
    load_default = load;
  }
});

// apps/cli/src/commands/terminal/reload.ts
var reload_exports = {};
__export(reload_exports, {
  default: () => reload_default
});
var reload, reload_default;
var init_reload = __esm({
  "apps/cli/src/commands/terminal/reload.ts"() {
    init_logCommand();
    reload = () => {
      logCommand_default("clear && az load");
    };
    reload_default = reload;
  }
});

// apps/cli/src/commands/terminal/restart.ts
var restart_exports = {};
__export(restart_exports, {
  default: () => restart_default
});
var restart, restart_default;
var init_restart = __esm({
  "apps/cli/src/commands/terminal/restart.ts"() {
    init_logCommand();
    restart = ({ command: { argv } }) => {
      const [_, ...childArgs] = argv;
      console.log("before...", { argv, childArgs });
      logCommand_default(("clear && zsh " + childArgs.join(" ")).trim());
      console.log("after...");
    };
    restart_default = restart;
  }
});

// apps/cli/src/commands/terminal/up.ts
var up_exports = {};
__export(up_exports, {
  default: () => up_default
});
var up, up_default;
var init_up = __esm({
  "apps/cli/src/commands/terminal/up.ts"() {
    init_logCommand();
    up = () => {
      logCommand_default(`cd ..`);
    };
    up_default = up;
  }
});

// import("../commands/**/*.ts") in apps/cli/src/utils/importCommand.ts
var globImport_commands_ts;
var init_ = __esm({
  'import("../commands/**/*.ts") in apps/cli/src/utils/importCommand.ts'() {
    globImport_commands_ts = __glob({
      "../commands/build.ts": () => Promise.resolve().then(() => (init_build(), build_exports)),
      "../commands/config/convert-to-zsh.ts": () => Promise.resolve().then(() => (init_convert_to_zsh(), convert_to_zsh_exports)),
      "../commands/config/initialise.ts": () => Promise.resolve().then(() => (init_initialise(), initialise_exports)),
      "../commands/config/print.ts": () => Promise.resolve().then(() => (init_print(), print_exports)),
      "../commands/config/set.ts": () => Promise.resolve().then(() => (init_set(), set_exports)),
      "../commands/debug/error.ts": () => Promise.resolve().then(() => (init_error(), error_exports)),
      "../commands/demo/context.ts": () => Promise.resolve().then(() => (init_context(), context_exports)),
      "../commands/fe/npkill.ts": () => Promise.resolve().then(() => (init_npkill(), npkill_exports)),
      "../commands/git/about.ts": () => Promise.resolve().then(() => (init_about(), about_exports)),
      "../commands/git/changes.ts": () => Promise.resolve().then(() => (init_changes(), changes_exports)),
      "../commands/git/commit.ts": () => Promise.resolve().then(() => (init_commit(), commit_exports)),
      "../commands/git/files-unstaged.ts": () => Promise.resolve().then(() => (init_files_unstaged(), files_unstaged_exports)),
      "../commands/git/local-commits.ts": () => Promise.resolve().then(() => (init_local_commits(), local_commits_exports)),
      "../commands/git/pull.ts": () => Promise.resolve().then(() => (init_pull(), pull_exports)),
      "../commands/git/push.ts": () => Promise.resolve().then(() => (init_push(), push_exports)),
      "../commands/lab/lab.ts": () => Promise.resolve().then(() => (init_lab(), lab_exports)),
      "../commands/sample/colors-true.ts": () => Promise.resolve().then(() => (init_colors_true(), colors_true_exports)),
      "../commands/sample/delayed.ts": () => Promise.resolve().then(() => (init_delayed(), delayed_exports)),
      "../commands/sample/dialogs.ts": () => Promise.resolve().then(() => (init_dialogs(), dialogs_exports)),
      "../commands/sample/hello.ts": () => Promise.resolve().then(() => (init_hello(), hello_exports)),
      "../commands/sample/lorem.ts": () => Promise.resolve().then(() => (init_lorem(), lorem_exports)),
      "../commands/sample/nested.ts": () => Promise.resolve().then(() => (init_nested(), nested_exports)),
      "../commands/sample/nested1.ts": () => Promise.resolve().then(() => (init_nested1(), nested1_exports)),
      "../commands/sample/nested2.ts": () => Promise.resolve().then(() => (init_nested2(), nested2_exports)),
      "../commands/start.ts": () => Promise.resolve().then(() => (init_start(), start_exports)),
      "../commands/system/envs.ts": () => Promise.resolve().then(() => (init_envs(), envs_exports)),
      "../commands/system/poweroff.ts": () => Promise.resolve().then(() => (init_poweroff(), poweroff_exports)),
      "../commands/terminal/here.ts": () => Promise.resolve().then(() => (init_here(), here_exports)),
      "../commands/terminal/load.ts": () => Promise.resolve().then(() => (init_load(), load_exports)),
      "../commands/terminal/reload.ts": () => Promise.resolve().then(() => (init_reload(), reload_exports)),
      "../commands/terminal/restart.ts": () => Promise.resolve().then(() => (init_restart(), restart_exports)),
      "../commands/terminal/up.ts": () => Promise.resolve().then(() => (init_up(), up_exports))
    });
  }
});

// apps/cli/src/utils/importCommand.ts
var importCommand, importCommand_default;
var init_importCommand = __esm({
  "apps/cli/src/utils/importCommand.ts"() {
    init_CommandImportError();
    init_();
    importCommand = async (command) => {
      try {
        const { default: module2 } = await globImport_commands_ts(`../commands/${command}.ts`);
        return module2;
      } catch (error) {
        console.error(error);
        throw new CommandImportError_default(command);
      }
    };
    importCommand_default = importCommand;
  }
});

// apps/cli/src/types/app/CommandInstance.ts
var import_minimist, CommandInstance, CommandInstance_default;
var init_CommandInstance = __esm({
  "apps/cli/src/types/app/CommandInstance.ts"() {
    import_minimist = __toESM(require("minimist"), 1);
    init_alias();
    init_importCommand();
    CommandInstance = class {
      constructor(argv) {
        this.run = async ({
          program,
          context
        }) => {
          const runCmd = await importCommand_default(this.name);
          await runCmd?.({
            program,
            context,
            command: this
          });
        };
        this.argv = argv || [];
        this.args = (0, import_minimist.default)(this.argv);
        const [argsName] = this.args._;
        const nameSelected = alias_default[argsName] || argsName;
        this.name = nameSelected;
      }
    };
    CommandInstance_default = CommandInstance;
  }
});

// apps/cli/src/types/app/ProgramInstance.ts
init_getUserConfig();

// libs/utils/src/logs/LoggerInstance.ts
var import_prompts = require("@clack/prompts");

// libs/utils/src/helpers/utils/noop.ts
var noop = () => {
};
var noop_default = noop;

// libs/utils/src/logs/LoggerInstance.ts
var LoggerInstance = class {
  constructor(params) {
    //   private _debug: Methods['debug'];
    this._methodsInitialised = {};
    this._methodsCache = {};
    this.preffixMessage = (message) => message ? `${this.preffix} ${message}` : this.preffix;
    this.getMethod = (method) => {
      if (!this._methodsInitialised[method]) {
        this._methodsInitialised[method] = true;
        this._methodsCache[method] = this.enabled ? this._overrides[method] || this[`_${method}`] : noop_default;
      }
      return this._methodsCache[method];
    };
    this.setEnabled = (enabled) => {
      this.enabled = enabled;
      this._methodsInitialised = {};
    };
    this.enable = () => this.setEnabled(true);
    this.disable = () => this.setEnabled(false);
    this._clear = () => console.clear();
    this._log = (...args) => console.log(this.preffix, ...args);
    this._debug = (...args) => console.debug(this.preffix, ...args);
    this._info = (message) => import_prompts.log.info(this.preffixMessage(message));
    this._message = (message, ...args) => import_prompts.log.message(this.preffixMessage(message), ...args);
    const { enabled = true, preffix = "", overrides } = params;
    this.enabled = enabled;
    this._overrides = overrides || {};
    this._methodsInitialised = {};
    this.preffix = preffix;
  }
  get clear() {
    return this.getMethod("clear");
  }
  get log() {
    return this.getMethod("log");
  }
  get debug() {
    return this.getMethod("debug");
  }
  get info() {
    return this.getMethod("info");
  }
  get message() {
    return this.getMethod("message");
  }
};
var LoggerInstance_default = LoggerInstance;

// apps/cli/src/types/app/ProgramInstance.ts
var import_colors5 = __toESM(require("colors"), 1);
var import_minimist2 = __toESM(require("minimist"), 1);
init_CommandInstance();

// apps/cli/src/types/app/ContextInstance.ts
var ContextInstance = class {
  constructor(program) {
    this.instantCommand = async (command) => await command.run({
      program: this.program,
      context: this
    });
    this.getFirstCommand = () => this.commands[0];
    this.removeFirstCommand = () => {
      const removedItem = this.commands.shift();
      this.debug.debug(
        "[ContextInstance] command removed. Length: ",
        this.commands.length
      );
      return removedItem;
    };
    this.run = async () => {
      const command = this.getFirstCommand();
      if (command) {
        this.debug.debug("[ContextInstance] command run", command.name);
        await command.run({
          program: this.program,
          context: this
        });
        this.removeFirstCommand();
      }
      if (this.commands.length > 0) {
        this.debug.debug("[ContextInstance] remain");
        return await this.run();
      }
    };
    this.commands = [];
    this.program = program;
  }
  get log() {
    return this.program.log;
  }
  get debug() {
    return this.program.debug;
  }
  addCommand(command) {
    this.commands.push(command);
    this.debug.debug(
      "[ContextInstance] command added. Length: ",
      this.commands.length
    );
  }
  addCommandTop(command) {
    this.commands.unshift(command);
    this.debug.debug(
      "[ContextInstance] command added. Length: ",
      this.commands.length
    );
  }
};
var ContextInstance_default = ContextInstance;

// apps/cli/src/types/app/ProgramInstance.ts
var ProgramInstance = class {
  constructor(argv) {
    this.preffix = import_colors5.default.cyan("\u2325\u2387 cli \uE0B0");
    this.addContext = (context) => {
      this.contexts.push(context);
      this.debug.debug("context added. Length: ", this.contexts.length);
    };
    this.getFirstContext = () => this.contexts[0];
    this.removeFirstContext = () => {
      const removedItem = this.contexts.shift();
      this.debug.debug("context removed. Length: ", this.contexts.length);
      return removedItem;
    };
    this.run = async () => {
      this.debug.debug("run. Argv: ", this.argv);
      const context = this.getFirstContext();
      if (context) {
        this.debug.debug("context run");
        await context.run();
        this.removeFirstContext();
      }
      if (this.contexts.length > 0) {
        this.debug.debug("remain");
        return await this.run();
      }
    };
    this.argv = argv;
    this.args = (0, import_minimist2.default)(this.argv);
    this.contexts = [];
    const context = new ContextInstance_default(this);
    const command = new CommandInstance_default(argv);
    context.addCommand(command);
    this.addContext(context);
    this.debug.log("[ProgramInstance] Argv:", this.argv);
    this.debug.log("[ProgramInstance] Args:", this.args);
  }
  get userConfig() {
    if (!this._userConfig)
      this._userConfig = getUserConfig_default({ configPath: this.env.AZ_CONFIG_DIR });
    return this._userConfig;
  }
  set userConfig(config) {
    this._userConfig = config;
  }
  get env() {
    if (!this._env)
      this._env = process.env;
    return this._env;
  }
  get log() {
    if (!this._log)
      this._log = new LoggerInstance_default({
        enabled: true,
        preffix: import_colors5.default.cyan("[AltZap:cli]:")
      });
    return this._log;
  }
  get debug() {
    if (!this._debug)
      this._debug = new LoggerInstance_default({
        enabled: this.userConfig.debug,
        preffix: import_colors5.default.magenta("\u2325\u2387:cli \uE0B0 \u{1F6A7}")
      });
    return this._debug;
  }
};
var ProgramInstance_default = ProgramInstance;

// apps/cli/src/app/programManager.ts
var programManager = new ProgramInstance_default(process.argv.slice(2));
var programManager_default = programManager;

// apps/cli/src/index.ts
var main = async () => {
  try {
    await programManager_default.run();
    process.exit(0);
  } catch (error) {
    console.error(error);
    process.exit(1);
  }
};
main();
