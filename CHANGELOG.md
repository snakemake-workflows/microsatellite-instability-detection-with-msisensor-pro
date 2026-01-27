# Changelog

## [1.1.1](https://github.com/snakemake-workflows/microsatellite-instability-detection-with-msisensor-pro/compare/v1.1.0...v1.1.1) (2026-01-27)


### Bug Fixes

* add validation that each sample name with a `panel_of_normals` alias is unique ([ba8af02](https://github.com/snakemake-workflows/microsatellite-instability-detection-with-msisensor-pro/commit/ba8af02db94e85a29ea3f521d53649fd2760a2e2))
* clarify all produced outputs for the msisensor-pro pro runs ([2ecc4f4](https://github.com/snakemake-workflows/microsatellite-instability-detection-with-msisensor-pro/commit/2ecc4f47cb0a858943ad00cacaecbcda4a3e3738))
* do not set sample column as index ([9d71149](https://github.com/snakemake-workflows/microsatellite-instability-detection-with-msisensor-pro/commit/9d711499a4a465a31cf6190b73ea8adde33def02))
* put log files into `logs/` folder instead of `results/` folder ([90238a0](https://github.com/snakemake-workflows/microsatellite-instability-detection-with-msisensor-pro/commit/90238a0f30b49108f29ab6345f2d2867096c91ac))
* small cleanup fixes ([204f6a6](https://github.com/snakemake-workflows/microsatellite-instability-detection-with-msisensor-pro/commit/204f6a6c38acdc7245e5fcb5e779fb82d6cf9f0b))
* truthiness ([13b483f](https://github.com/snakemake-workflows/microsatellite-instability-detection-with-msisensor-pro/commit/13b483f462e3cf06c3153abfa97331a30a880d7d))


### Performance Improvements

* make panel_of_normals list creation a localrule, as this is an inexpensive little script ([2c985ff](https://github.com/snakemake-workflows/microsatellite-instability-detection-with-msisensor-pro/commit/2c985ff5749b009fe30c2d0b0f393aa313fd45ed))

## [1.1.0](https://github.com/snakemake-workflows/microsatellite-instability-detection-with-msisensor-pro/compare/v1.0.0...v1.1.0) (2026-01-23)


### Features

* add tumor_matched_normal mode, matched normal samples for each patient ([c451ab6](https://github.com/snakemake-workflows/microsatellite-instability-detection-with-msisensor-pro/commit/c451ab6cd375cf3541604e4279f9c276c9b3063a))
* add tumor_normal calling with matched normal samples (one normal sample per tumor sample) ([be2166d](https://github.com/snakemake-workflows/microsatellite-instability-detection-with-msisensor-pro/commit/be2166db9a98efb3fa910e1c63ffece67fc83a6b))


### Bug Fixes

* actually load the new smk file :facepalm: ([f5d1e77](https://github.com/snakemake-workflows/microsatellite-instability-detection-with-msisensor-pro/commit/f5d1e77a7aa7c2317a55d22df43e4afd09ce5b54))
* check for duplicate group-alias pairs in samples.tsv, to avoid cryptic errors ([9b509f4](https://github.com/snakemake-workflows/microsatellite-instability-detection-with-msisensor-pro/commit/9b509f461930f405f5fe156ba58e4631bc3d0fd7))
* clean up rule readability with input function ([3058ce6](https://github.com/snakemake-workflows/microsatellite-instability-detection-with-msisensor-pro/commit/3058ce6c37d9a8c60902fa8d4adf2efd13eb1ac9))
* ensure correct sample is chosen for panel_of_normals mode, by also looking at alias ([24de323](https://github.com/snakemake-workflows/microsatellite-instability-detection-with-msisensor-pro/commit/24de32351085fed395eb132ecf526563ca6e5931))
* extra quote removed ([aeb43cc](https://github.com/snakemake-workflows/microsatellite-instability-detection-with-msisensor-pro/commit/aeb43cc8ff2aaf4f0392d9176705056a628c1346))
* missing closing quotes ([4a8f1fe](https://github.com/snakemake-workflows/microsatellite-instability-detection-with-msisensor-pro/commit/4a8f1fe9d1dcab06e107b5eabb08d2964eff1296))
* provide empty defaults for config alias lookups of normal samples ([7a408c8](https://github.com/snakemake-workflows/microsatellite-instability-detection-with-msisensor-pro/commit/7a408c8ac3316b02173b4b82975e273a4f72119b))
* syntax ([ba3bf72](https://github.com/snakemake-workflows/microsatellite-instability-detection-with-msisensor-pro/commit/ba3bf72957038e8fa2b3a3d3ba42b40e54e7946e))


### Performance Improvements

* constrain group wildcard ([2be774a](https://github.com/snakemake-workflows/microsatellite-instability-detection-with-msisensor-pro/commit/2be774abe737e293db12f9cd8a8b5a8805a0ca2f))

## 1.0.0 (2026-01-21)


### Features

* initial working version for tumor_only (with a baseline panel of normal samples), runs with msisensor-pro demo data ([2ed510a](https://github.com/snakemake-workflows/microsatellite-instability-detection-with-msisensor-pro/commit/2ed510acabc411ed708cabed1cd599f3c209da39))


### Bug Fixes

* add python conda env to satisfy linter, rename to panel_of_normals for more descriptive naming ([e7b2d37](https://github.com/snakemake-workflows/microsatellite-instability-detection-with-msisensor-pro/commit/e7b2d370dc7f512b5a227d8d077a145bf5f8d9bf))
* consistently rename to panel_of_normals (instead of baseline) and matched_normal (instead of just normal) ([5a53556](https://github.com/snakemake-workflows/microsatellite-instability-detection-with-msisensor-pro/commit/5a535564e6e6f36e429cc5d25467d93b29a79c09))
* missing replacement of baseline ([c8c79d4](https://github.com/snakemake-workflows/microsatellite-instability-detection-with-msisensor-pro/commit/c8c79d49d12c26cd0095c5116ea47f38c5daf04c))
* move schemas to workflow/ directory ([52dcb9c](https://github.com/snakemake-workflows/microsatellite-instability-detection-with-msisensor-pro/commit/52dcb9cbdacb2b799d484b0eba52d7bc3c165fad))
* rename script according to refactoring ([923279e](https://github.com/snakemake-workflows/microsatellite-instability-detection-with-msisensor-pro/commit/923279eec443f9a440eb37f84ed53d8f66036442))
* switch to panel_of_normals instead of baseline in alias config, as well ([895146c](https://github.com/snakemake-workflows/microsatellite-instability-detection-with-msisensor-pro/commit/895146c581207e8b16b30d18b6926ebb5a24e317))

## [1.1.0](https://github.com/snakemake-workflows/snakemake-workflow-template/compare/v1.0.0...v1.1.0) (2025-07-29)


### Features

* complete minimal workflow as template ([2348055](https://github.com/snakemake-workflows/snakemake-workflow-template/commit/234805535a6353a3db59d5bba0a4b38fe8194d97))
* complete, reproducible example workflow ([1dfa7ad](https://github.com/snakemake-workflows/snakemake-workflow-template/commit/1dfa7adb0120880ae5e85c57551d5e698a057497))
* larger update to feature fully-functional example and github actions ([93c08fc](https://github.com/snakemake-workflows/snakemake-workflow-template/commit/93c08fc9db2f8619af7b90784db83d18ed656f25))
* major simplification of rules, replacement of others by wrappers ([3811ef7](https://github.com/snakemake-workflows/snakemake-workflow-template/commit/3811ef796df4fe38fb7161f9a1b06fac9db86d5b))
* major simplification of template and update docs ([81ee089](https://github.com/snakemake-workflows/snakemake-workflow-template/commit/81ee08989857366893593a333615523f05295f87))
* replaced get genome script with simple shell command ([9208995](https://github.com/snakemake-workflows/snakemake-workflow-template/commit/9208995b78433ce3680a0b0e453ddcf5915abcef))
* update github actions workflow in linting part ([27d53ee](https://github.com/snakemake-workflows/snakemake-workflow-template/commit/27d53eecfad935f50bc62a30248141891a4329ee))
* update github actions workflow. check formatting of yaml files using prettier ([9f5131b](https://github.com/snakemake-workflows/snakemake-workflow-template/commit/9f5131bf0eeaf1eb7fb0937b2840f73db2a02724))
* updated all GH actions to latest versions ([4d7b3a2](https://github.com/snakemake-workflows/snakemake-workflow-template/commit/4d7b3a2b143c304b6dcf487664c392c4a5e98f74))
* updated github actions workflow ([fd36648](https://github.com/snakemake-workflows/snakemake-workflow-template/commit/fd3664841b830ae670549aabb214eb6004aa696d))
* updated github actions workflow ([7a3a40e](https://github.com/snakemake-workflows/snakemake-workflow-template/commit/7a3a40e62df01b37a802a085e7210014eb3fba82))


### Bug Fixes

* 2nd attempt to fix release please wf ([f81847f](https://github.com/snakemake-workflows/snakemake-workflow-template/commit/f81847fdfd39d99e795006da4f84701ee6ba8ddc))
* added usage docs ([776b97e](https://github.com/snakemake-workflows/snakemake-workflow-template/commit/776b97e3d0e928d98f4c48e619090b47f702dcab))
* all-temp needs explicit input of multiqc zip dirs ([026c35a](https://github.com/snakemake-workflows/snakemake-workflow-template/commit/026c35aebfb140746bc823ce06327e25c9a40cf1))
* change release type to 'go', fixes release please wf ([658c784](https://github.com/snakemake-workflows/snakemake-workflow-template/commit/658c784ab5d70b117ce9dd386f5b07f8e4ff782d))
* change release type to 'go', fixes release please wf ([a81ab9d](https://github.com/snakemake-workflows/snakemake-workflow-template/commit/a81ab9def05667e23c5e59ac881c7a57b9f1b767))
* code review issues ([97faf1a](https://github.com/snakemake-workflows/snakemake-workflow-template/commit/97faf1ae8bde189094e6b46568f3911f01b625fd))
* dont remove temp files for test runs ([0c2c8d1](https://github.com/snakemake-workflows/snakemake-workflow-template/commit/0c2c8d19c51648872d09a8f697826b9445bafc81))
* formatting, logging ([d6c819e](https://github.com/snakemake-workflows/snakemake-workflow-template/commit/d6c819efcadde1ad4af342152d3aef2a982983d0))
* lint error and docs update ([cf59f11](https://github.com/snakemake-workflows/snakemake-workflow-template/commit/cf59f11acc11c01866ad56971fd132661f4f32be))
* recommended `.yaml` file extension, latest schema version ([e649e12](https://github.com/snakemake-workflows/snakemake-workflow-template/commit/e649e12be9c447e8c366847ddf3531e216306c97))
* release please workflow requires additional permission ([0993271](https://github.com/snakemake-workflows/snakemake-workflow-template/commit/0993271f0077e5a548755679b2b8952d18795580))
* release please workflow requires additional permission ([3651295](https://github.com/snakemake-workflows/snakemake-workflow-template/commit/36512953f851611f18676a4f18e6e5684932ef61))
* removed unused templates, update catalog yml ([b5c292f](https://github.com/snakemake-workflows/snakemake-workflow-template/commit/b5c292ff4b476441d8068ca8013e3b931d30fc04))
* revert to GitHub Actions status badge requiring `owner` and `repo` set by user ([dd163f3](https://github.com/snakemake-workflows/snakemake-workflow-template/commit/dd163f33a5299ecbeb10eb019ef5e8c727f0422a))
* snakefmt error ([70d670a](https://github.com/snakemake-workflows/snakemake-workflow-template/commit/70d670a91c79c0a9d89c59fff6add3f1036753a3))
* update release-please GH workflow ([1dad25d](https://github.com/snakemake-workflows/snakemake-workflow-template/commit/1dad25da5de222982b0cdf35a91be6ecc5a81a42))
* update release-please GH workflow ([0ea4df2](https://github.com/snakemake-workflows/snakemake-workflow-template/commit/0ea4df2f746e0fc760c06a3b902e2ee8bdf2ff42))
* update snakemake action ([fac8662](https://github.com/snakemake-workflows/snakemake-workflow-template/commit/fac8662193fa501fdfc2f3bb94e7549b96dec500))
* updated schemas and params docs ([facf377](https://github.com/snakemake-workflows/snakemake-workflow-template/commit/facf377a7cc107b3e8db0793b21027a9f3df0eeb))
* updates to enable release-please action again ([8d9552b](https://github.com/snakemake-workflows/snakemake-workflow-template/commit/8d9552b8369ca6b115ee00777f45cf641312dde3))
* use recommended `.yaml` file extension (https://www.yaml.info/learn/bestpractices.html#file) ([dc3dc1a](https://github.com/snakemake-workflows/snakemake-workflow-template/commit/dc3dc1aa798a009644f938ef41df02f370e09466))
* various changes to formatting and example rules ([b9b2366](https://github.com/snakemake-workflows/snakemake-workflow-template/commit/b9b236645ad961cd7a8886c1697b27f3694ee047))

## 1.0.0 (2025-05-07)


### Features

* complete minimal workflow as template ([2348055](https://github.com/snakemake-workflows/snakemake-workflow-template/commit/234805535a6353a3db59d5bba0a4b38fe8194d97))
* complete, reproducible example workflow ([1dfa7ad](https://github.com/snakemake-workflows/snakemake-workflow-template/commit/1dfa7adb0120880ae5e85c57551d5e698a057497))
* larger update to feature fully-functional example and github actions ([93c08fc](https://github.com/snakemake-workflows/snakemake-workflow-template/commit/93c08fc9db2f8619af7b90784db83d18ed656f25))
* major simplification of rules, replacement of others by wrappers ([3811ef7](https://github.com/snakemake-workflows/snakemake-workflow-template/commit/3811ef796df4fe38fb7161f9a1b06fac9db86d5b))
* major simplification of template and update docs ([81ee089](https://github.com/snakemake-workflows/snakemake-workflow-template/commit/81ee08989857366893593a333615523f05295f87))
* replaced get genome script with simple shell command ([9208995](https://github.com/snakemake-workflows/snakemake-workflow-template/commit/9208995b78433ce3680a0b0e453ddcf5915abcef))
* update github actions workflow in linting part ([27d53ee](https://github.com/snakemake-workflows/snakemake-workflow-template/commit/27d53eecfad935f50bc62a30248141891a4329ee))
* update github actions workflow. check formatting of yaml files using prettier ([9f5131b](https://github.com/snakemake-workflows/snakemake-workflow-template/commit/9f5131bf0eeaf1eb7fb0937b2840f73db2a02724))
* updated all GH actions to latest versions ([4d7b3a2](https://github.com/snakemake-workflows/snakemake-workflow-template/commit/4d7b3a2b143c304b6dcf487664c392c4a5e98f74))
* updated github actions workflow ([fd36648](https://github.com/snakemake-workflows/snakemake-workflow-template/commit/fd3664841b830ae670549aabb214eb6004aa696d))
* updated github actions workflow ([7a3a40e](https://github.com/snakemake-workflows/snakemake-workflow-template/commit/7a3a40e62df01b37a802a085e7210014eb3fba82))


### Bug Fixes

* 2nd attempt to fix release please wf ([f81847f](https://github.com/snakemake-workflows/snakemake-workflow-template/commit/f81847fdfd39d99e795006da4f84701ee6ba8ddc))
* added usage docs ([776b97e](https://github.com/snakemake-workflows/snakemake-workflow-template/commit/776b97e3d0e928d98f4c48e619090b47f702dcab))
* all-temp needs explicit input of multiqc zip dirs ([026c35a](https://github.com/snakemake-workflows/snakemake-workflow-template/commit/026c35aebfb140746bc823ce06327e25c9a40cf1))
* change release type to 'go', fixes release please wf ([658c784](https://github.com/snakemake-workflows/snakemake-workflow-template/commit/658c784ab5d70b117ce9dd386f5b07f8e4ff782d))
* change release type to 'go', fixes release please wf ([a81ab9d](https://github.com/snakemake-workflows/snakemake-workflow-template/commit/a81ab9def05667e23c5e59ac881c7a57b9f1b767))
* code review issues ([97faf1a](https://github.com/snakemake-workflows/snakemake-workflow-template/commit/97faf1ae8bde189094e6b46568f3911f01b625fd))
* dont remove temp files for test runs ([0c2c8d1](https://github.com/snakemake-workflows/snakemake-workflow-template/commit/0c2c8d19c51648872d09a8f697826b9445bafc81))
* formatting, logging ([d6c819e](https://github.com/snakemake-workflows/snakemake-workflow-template/commit/d6c819efcadde1ad4af342152d3aef2a982983d0))
* lint error and docs update ([cf59f11](https://github.com/snakemake-workflows/snakemake-workflow-template/commit/cf59f11acc11c01866ad56971fd132661f4f32be))
* removed unused templates, update catalog yml ([b5c292f](https://github.com/snakemake-workflows/snakemake-workflow-template/commit/b5c292ff4b476441d8068ca8013e3b931d30fc04))
* snakefmt error ([70d670a](https://github.com/snakemake-workflows/snakemake-workflow-template/commit/70d670a91c79c0a9d89c59fff6add3f1036753a3))
* update release-please GH workflow ([1dad25d](https://github.com/snakemake-workflows/snakemake-workflow-template/commit/1dad25da5de222982b0cdf35a91be6ecc5a81a42))
* update release-please GH workflow ([0ea4df2](https://github.com/snakemake-workflows/snakemake-workflow-template/commit/0ea4df2f746e0fc760c06a3b902e2ee8bdf2ff42))
* update snakemake action ([fac8662](https://github.com/snakemake-workflows/snakemake-workflow-template/commit/fac8662193fa501fdfc2f3bb94e7549b96dec500))
* updated schemas and params docs ([facf377](https://github.com/snakemake-workflows/snakemake-workflow-template/commit/facf377a7cc107b3e8db0793b21027a9f3df0eeb))
* updates to enable release-please action again ([8d9552b](https://github.com/snakemake-workflows/snakemake-workflow-template/commit/8d9552b8369ca6b115ee00777f45cf641312dde3))
* various changes to formatting and example rules ([b9b2366](https://github.com/snakemake-workflows/snakemake-workflow-template/commit/b9b236645ad961cd7a8886c1697b27f3694ee047))
