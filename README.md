## A sample iOS project for creating multiple environments for your app.
### The goals of this project are as follow:
1. Create three different environments (or versions) of the same app. For example, one for the development team, one for the quality assurance team (QA), and one for the end customers (Release).
2. To be able to install these different environments as separate apps on the same device at the same time.
3. Each environment (version) has its own app name, app icon, and variable values (for example, a variable called `baseURL` can have a different value for each environment)

**To know the exact steps to create such app, continue reading.**

### Create three different environments
1. In the **project navigator panel** select the project.
2. Under the **target** section, *right-click* your target and select *duplicate*.
3. Now you will have a new target named `project_name copy`. This step will also create:
	* A new **schema** named `project_name copy`
	* A new **.plist** file named `project_name copy.plist`
So, to name this new target to something useful you have to rename the following:
	* The new duplicated target.
		- Select the new target and tap *Enter* and rename it to 		`project_name Dev`
	* The new schema.
		- Select the schemes drop-down menu
		- Select *Manage Schemes...*
		- Tap *Enter* on the new schema name `project_name copy` and 
		rename it to `project_name Dev`
	* The new `.plist` file
		- In the **project navigator panel** expand the group
		**products**.
		- Tap *Enter* on the new **.plist** file named 
		`project_name copy.plist` and rename it to
		`project_name Dev.plist`
		- Now because of the renaming steps above, the link between the 
		new target and the new .plist file is broken. To fix it:
			* In the **project navigator panel** select your project.
			* Select **Build Settings** tab.
			* Under the **Packaging** section, select 
			**info.plist File** without expanding the row.
			* Enter the value `product_name Dev.plist`

### Create different app name and bundle identifier for each environment/target
1. Select the new target `project_name Dev`
2. Select the **General** tab.
3. Under the identity section:
	* Change **Display Name** to something like `app_name Dev`
	* Change the **Bundle Identifier** to something like `com.companyName.appName.Dev`
**Note: Changing the bundle identifier to something different than other targets is the necessary step to be able to run each target as a separate app in your device**

### Create different app icon for each environment/target
1. In the **project navigator panel** select **Assets.xcassets**
2. In the bottom-left select the **+** button then **App Icons & Launch Images** then **New iOS App Icon**.
3. Rename the newly added app icon to something like `app_icon Dev`
4. Add your desired icons.
5. Go back to the **project navigator panel** then select your project then select your new target `project_name Dev`.
6. Select the **General** tab.
7. Under the **App Icons and Launch Images** section:
	* Select the **App Icons Source** drop-down and select your desired icon name.

### Create a variable with different values for each environment/target
There are two ways to have variables with different values for each environment/target:
1. Compiler Flags
2. Plist Variables

#### Option 1: Compiler Flags
1. In the **project navigator panel** select your project.
2. Select the original target `project_name`.
3. Select **Build Settings**.
4. Select **All**.
5. Find a section called **Other Swift Flags** then select it without expanding the row.
6. Write the value of this row as `-D RELEASE` (The syntax is like this: -D FLAG_NAME)
7. Select the second target `project_name Dev`
8. Repeat the steps from 1 to 6 but this time, give the value as `-D DEVELOPMENT` in step 6.
9. Now in the code you can do something like this:
  ```
	    var value = “”
        #if RELEASE
        value = “Release”
        #elseif DEVELOPMENT
        value = “Development”
        #endif
  ```
  If you run the `project_name` target, `value` will be `”Release”`.
  If you run the `project_name Dev` target, `value` will be `”Development”`.

#### Option 2: Plist Variables 
1. In the **project navigator panel** select the file *info.plist* (Note: this is the .plist file for the `project_name` target).
2. Add a new row to the plist file (right-click then select *add row* or click on the **+** button on any row to add a new one)
3. Add the desired key, type and value. For example in the project, I added the key *labelValue* of type *String* and the value `”Release”`
4. In the **project navigator panel** expand the group **products**.
5. Select the file `project_name Dev.plist` (Note: this is the .plist file for the `project_name Dev` target).
6. Add a new row to the plist file.
7. Use the same key used in the first target, but this time with different value. For example, I added the key *labelValue* of type *String* and the value `”Development”`.
8. Now in the code you can do something like this:
  ```
	let value = object(forInfoDictionaryKey: “LabelValue”) as? String
  ```
  If you run the `project_name` target, `value` will be `”Release”`.
  If you run the `project_name Dev` target, `value` will be `”Development”`.
