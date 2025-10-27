{inputs, ...}: {
  flake = rec {
    templates.default = {
      description = "A minimal JavaScript project template with Bun and Nix";
      path = inputs.self;
    };

    om.templates.javascript-template = {
      template = templates.default;
      params = [
        {
          name = "package-name";
          description = "Name of the JavaScript package";
          placeholder = "javascript-template";
        }
      ];
    };
  };
}
