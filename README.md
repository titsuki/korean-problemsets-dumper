# Korean Problemsets Dumper

## Installation

1. Go to [this page](https://ankiweb.net/shared/info/350030456) and click the download button.
2. Run the setup script:

```bash
$ cp /path/to/the/dir/TOPIK__.apkg .
$ bash setup.sh
```

3. Copy the generated audio folder and JSONL file into the `public` directory of [the app](https://github.com/titsuki/korean-dictation-app):

```bash
$ cp -rp audio /path/to/the/korean-dictaion-app/public/
$ cp -p topik1800-problemsets.jsonl /path/to/the/korean-dictation-app/public/
```
