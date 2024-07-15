SDK Template App


This Flutter application template provides a structured starting point for your SDK-based projects.

Building and Releasing the SDK Package

Building the Package

To build the SDK package for distribution:

flutter build package

This command generates a .tar.gz archive file containing your SDK package.

Releasing the Package

1) Prepare for release:

Ensure all necessary files and configurations are included in the generated package.

2) Publish the package:

Publish your SDK package to a package repository like pub.dev:

flutter pub publish

Installation

To use the deliverytemplate package in your Flutter project, run the following command:

flutter pub add deliverytemplate

This command adds the deliverytemplate package to your pubspec.yaml file and installs it into your project.
