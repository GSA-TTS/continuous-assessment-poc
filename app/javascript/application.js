// Entry point for the build script in your package.json

import "@uswds/uswds"

import { i18n } from './i18n';

console.log(i18n.t('shared.banner.official_site'));
