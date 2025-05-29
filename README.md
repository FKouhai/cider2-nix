# Cider 3 on nix systems

Current supported version: v3.0.2

### Building
`nix build`

>Note: you have to provide your own `Cider-${version}.AppImage` file from their itch.io page

### Installing
`nix profile install`

In case there's any issues with a conflicting package in the profile run:
```bash
nix profile remove Cider
```


## Fetched from
https://git.nvds.be/NicolaiVdS/Nix-Cider2
