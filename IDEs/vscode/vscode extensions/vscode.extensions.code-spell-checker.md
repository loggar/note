# vscode extensions: Code Spell Checker

`cSpell.json`

```json
{
  // Version of the setting file.  Always 0.1
  "version": "0.1",
  // language - current active spelling language
  "language": "en,en-GB",
  // words - list of words to be always considered correct
  "words": ["lerna", "overconsume"],
  // flagWords - list of words to be always considered incorrect
  // This is useful for offensive words and common spelling errors.
  // For example "hte" should be "the"
  "flagWords": ["hte"],
  "ignoreWords": [],
  "dictionaryDefinitions": [
    {
      "name": "cities",
      "path": "./sampleDictionaries/cities.txt"
    }
  ],
  "dictionaries": ["cities"],
  "languageSettings": [
    {
      "languageId": "*",
      "dictionaries": []
    }
  ]
}
```

`settings.json`

```json
{
  "cSpell.enabled": true,
  "cSpell.showStatus": true,
  "cSpell.enabledLanguageIds": ["markdown"],
  "cSpell.language": "en,en-GB"
}
```
