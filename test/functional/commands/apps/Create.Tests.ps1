Import-Module -Name $env:CLI_ROOT/test/functional/util/CliHelper.psm1

Describe "apps create" {
  function GetPreciseDateString() {
    return $((Get-Date).ToString("yyyy-MM-dd_HH.mm.ffffff"))
  }

  function RemoveApp($app) {
    $appFullName = $app.owner.name + "/" + $app.name
    appcenter apps delete --app $appFullName --quiet
  }

  It "creates a new app when all required parameters are provided with valid values" {
    # Arrange
    $previousNumberOfApps = (appcenter apps list --output json | ConvertFrom-Json).Count
    $appDisplayName = "Test apps create $(GetPreciseDateString)"
    $appOs = "Android"
    $appPlatform = "Java"

    # Act
    $app = appcenter apps create --platform $appPlatform --os $appOs --display-name $appDisplayName --output json | ConvertFrom-Json

    # Assert
    $app.displayName | Should -Be $appDisplayName
    $app.os | Should -Be $appOs
    $app.platform | Should -Be $appPlatform

    $newNumberOfApps = (appcenter apps list --output json | ConvertFrom-Json).Count
    $newNumberOfApps | Should -Be ($previousNumberOfApps + 1)

    # Cleanup
    RemoveApp $app
  }

  It "can handle Unicode display names" {
    if($IsWindows) {
      Set-ItResult -Skipped -Because "Windows can't handle the Unicode characters"
    }

    # Arrange
    $unicodeName = "어플 $(GetPreciseDateString)"

    # Act
    $app = appcenter apps create --os Android --platform Java --display-name $unicodeName --output json | ConvertFrom-Json

    # Assert
    $app.displayName | Should -Be $unicodeName

    RemoveApp $app
  }

  It "can take a all optional parameters" {
    # Arrange
    $displayName = "Test apps create optional params $(GetPreciseDateString)"
    $name = "app-name$(GetPreciseDateString)"
    $releaseType = "Beta"
    $description = "Lots of words going straight into the void."

    # Act
    $app = appcenter apps create --os Android --platform Java --display-name $displayName --name $name --release-type $releaseType --description $description --output json | ConvertFrom-Json

    # Assert
    $app.displayName | Should -Be $displayName
    $app.name | Should Be $name
    $app.releaseType | Should -Be $releaseType
    $app.description | Should -Be $description

    # Cleanup
    RemoveApp $app
  }

  It -Skip "can create all valid OS/platform combinations" {
    # Arrange
    $supportedCombinations = @(
      @("iOS", "Objective-C-Swift"),
      @("iOS", "React-Native"),
      @("iOS", "Cordova"),
      @("iOS", "Xamarin"),
      @("iOS", "Unity"),
      @("Android", "Java"),
      @("Android", "React-Native"),
      @("Android", "Cordova"),
      @("Android", "Xamarin"),
      @("Android", "Unity"),
      @("Windows", "UWP"),
      @("Windows", "WPF"),
      @("Windows", "WinForms"),
      @("Windows", "Unity"),
      @("macOS", "Objective-C-Swift"),
      @("tvOS", "Objective-C-Swift"),
      @("Tizen", "Xamarin"),
      @("Linux", "Electron"),
      @("Custom", "Custom")
    )

    # Act
    foreach($combination in $supportedCombinations) {
      $os = $combination[0]
      $platform = $combination[1]
      $displayName = "$os $platform $(GetPreciseDateString)"
      $app = appcenter apps create --os $os --platform $platform --display-name $displayName --output json | ConvertFrom-Json

      # Assert
      $app.displayName | Should -Be $displayName
      $app.os | Should -Be $os
      $app.platform | Should -Be $platform

      # Cleanup
      RemoveApp $app
    }
  }

  It "shows an error for invalid platform" {
    # Arrange
    $os = "Android"
    $invalidPlatform = "blabla"

    # Act
    $output = appcenter apps create --os $os --platform $invalidPlatform --display-name myapp --output json

    # Assert
    $output | Should -Match "Validation error for body parameter `"app.platform`": No enum match for: $invalidPlatform"
  }

  It "shows an error for invalid os/platform combination" {
    # Arrange
    $os = "Android"
    $invalidPlatform = "UWP"

    # Act
    $output = appcenter apps create --os $os --platform $invalidPlatform --display-name myapp --output json

    # Assert
    $output | Should -Match  "Validation error: `"$invalidPlatform`" is not a valid platform for OS `"$os`"!"
  }

  It "shows an error for invalid name" {
    # Arrange
    $invalidName = "My app"

    # Act
    $output = appcenter apps create --os Android --platform Java --display-name myapp --name $invalidName --output json

    # Assert
    $output | Should -Match  "name can only contain alphanumeric characters, underscore, hyphen, and period."
  }

  It "shows an error for invalid release-type" {
    # Arrange
    $invalidReleaseType = "beta"

    # Act
    $output = appcenter apps create --os Android --platform Java --display-name myapp --release-type $invalidReleaseType --output json

    # Assert
    $output | Should -Match "Validation error: release type must be alphanumeric and start with a capital letter or number, and the rest of the string should be lowercase"
  }
}