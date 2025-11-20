amino_map = {"AUG":"Methionine",  
               "UUU":"Phenylalanine",
               "UUC":"Phenylalanine",
               "UUA":"Leucine",
               "UUG":"Leucine",
               "UCU":"Serine",
               "UCC":"Serine",
               "UCA":"Serine",
               "UCG":"Serine",
               "UAU":"Tyrosine",
               "UAC":"Tyrosine",
               "UGU":"Cysteine",
               "UGC":"Cysteine",
               "UGG":"Tryptophan",
               "UAA":"STOP",
               "UAG":"STOP",
               "UGA":"STOP"}

def triplets(strand):
    return [strand[i:i+3] for i in range(0, len(strand),3)]

def proteins(strand):
    polypeptide = []
    trips = triplets(strand)
    for triplet in trips:
        if triplet in amino_map:
            amino = amino_map[triplet]
            if amino=="STOP":
                return polypeptide
            else:
                polypeptide.append(amino)
    return polypeptide
    
