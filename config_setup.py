import os, yaml, collections

# https://stackoverflow.com/a/18394648
def update(orig_dict, new_dict):
    for key, val in new_dict.iteritems():
        if isinstance(val, collections.Mapping):
            tmp = update(orig_dict.get(key, { }), val)
            orig_dict[key] = tmp
        elif isinstance(val, list):
            orig_dict[key] = (orig_dict.get(key, []) + val)
        else:
            orig_dict[key] = new_dict[key]
    return orig_dict

settings = {}

with open('searx/settings.yml', 'r+') as f, \
     open('settings.local.yml', 'r') as g:

    settings = yaml.load(f)
    override = yaml.load(g)

    if(!override['server']['secret_key'])
        override['server']['secret_key'] = os.urandom(32)

    settings = update(settings, override)

    f.seek(0)
    f.write(yaml.dump(settings))
    f.truncate()

