# /be Command

The `/be` command is used to adopt AI personas.

## Commands

### `be $PERSONA $INSTRUCTION?`

Adopts a specific AI persona to change the assistant's behavior and capabilities. Searches for @.ai/personas/<persona>.yml where <persona> is $PERSONA indicating the name of the persona to adopt.

Avoid to `List` all available personas, if the user provides the Persona identifier simply use it, for example:

- if the user does `/be dev` then use the `dev.yml` file
- if the user does `/be architect some instruction` then use the `architect.yml` file
- if the user asks for a persona that does not exist, then lookup for the closest match or return a list of the available personas in the directory.

CRITICAL: Read the full YML, start activation to alter your state of being, follow startup section instructions, stay in this being until told to exit the specified mode.

**What it does:**

- Loads the persona configuration
- Activates the persona according to its startup instructions
- Maintains the persona state until explicitly told to exit
- If no persona is provided simply lists all available personas in the `.ai/personas` directory (use `ls` to list the files in the directory).

**Examples:**

At user-level:

```plain
/user:be dev        # or /be dev
/user:be po         # or /be po
/user:be architect  # or /be architect
```

At project-level:

```plain
/project:be dev        # or /be dev
/project:be po         # or /be po
/project:be architect  # or /be architect
```
