class Scale:
    def __init__(self, tonic):
        sharp_tonics = {"C","a","G","D","A","E","B","F#","e","b","f#","c#","g#","d#"}
        # flat_tonics = "FBbEbAbDbGbdgcfbbee"
        use_sharps = tonic in sharp_tonics
        
        sharp_notes = ["C","C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"]
        flat_notes = ["C", "Db", "D", "Eb", "E", "F", "Gb", "G", "Ab", "A", "Bb", "B"]

        if use_sharps:
            idx = sharp_notes.index(tonic.upper())
            self.notes = sharp_notes[idx:]+sharp_notes[:idx]
        else: # use flats
            tonic = tonic.upper()
            if len(tonic)==2:
                tonic = tonic[0] + 'b'
            idx = flat_notes.index(tonic)
            self.notes = flat_notes[idx:] + flat_notes[:idx]   
        
                 
    def chromatic(self):
        return self.notes

    def interval(self, intervals):
        output = [self.notes[0]]
        idx = 0
        for itv in intervals:
            if itv in ["M","m","A"]:
                if itv=="M":
                    idx +=2
                elif itv=="m":
                    idx +=1
                elif itv=="A":
                    idx +=3
                idx%=12
                output.append(self.notes[idx])
        return output
            
            
