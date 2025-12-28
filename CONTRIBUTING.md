# Contributing to SDVersion

Thank you for your interest in contributing to SDVersion! This document provides guidelines for contributing.

## Adding New Device Support

When Apple releases new devices, SDVersion needs to be updated. Here's how:

### Finding Device Identifiers

Device identifiers (machine IDs) can be found from these sources:
- [The Apple Wiki - Models](https://theapplewiki.com/wiki/Models)
- [EveryMac](https://everymac.com)
- [AppleDB](https://appledb.dev)
- [adamawolf's gist](https://gist.github.com/adamawolf/3048717)

### Adding a New iPhone/iPad

1. **Update `SDiOSVersion.h`:**
   - Add a new enum value in the appropriate year section
   - Use the next available integer value in that section

2. **Update `SDiOSVersion.m`:**
   - Add the device identifier mapping in `deviceNamesByCode`
   - Add the display name in `deviceNameForVersion:`

3. **Update screen size detection if needed:**
   - If the device has a new screen resolution, update `resolutionSize`

### Adding a New Apple Watch

1. **Update `SDwatchOSVersion.h`:**
   - Add enum values for each size variant

2. **Update `SDwatchOSVersion.m`:**
   - Add identifier mappings
   - Update display names
   - Update screen size detection if new sizes are introduced

### Adding a New Mac

1. **Update `SDMacVersion.h`:**
   - Add new ChipType if applicable (M5, etc.)

2. **Update `SDMacVersion.m`:**
   - Add model detection in `deviceInformationForModel:`
   - Map to appropriate device version and chip type

## Code Style

- Follow existing Objective-C conventions in the codebase
- Use 4-space indentation
- Keep device mappings alphabetically organized by identifier
- Group devices by year in comments

## Testing

Before submitting a PR:
1. Ensure the project builds on all platforms (iOS, macOS, watchOS, tvOS)
2. Test with the simulator for new devices if available
3. Run `pod lib lint` to validate the podspec

## Pull Request Process

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/add-iphone-17`)
3. Commit your changes with clear messages
4. Update the CHANGELOG.md
5. Submit a pull request

## Questions?

Open an issue for discussion before making large changes.
