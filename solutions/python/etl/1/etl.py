def transform(legacy_data):
    data = {}
    for key,value in legacy_data.items():
        for v in value:
            data[v.lower()] = key
    return data
