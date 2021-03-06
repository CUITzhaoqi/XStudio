//xlang Source, Name:JsonRPC.x 
//Date: Sat Apr 02:31:25 2020 

class JsonRPC : EchoBuffer{

    int findstart = 0;
    
    public bool memcmp(int ofst, @NotNilptr byte [] pb){
        for (int i = 0; i < pb.length; i++){
            if (data[i + ofst] != pb[i]){
                return false;
            }
        }
        return true;
    }
    
    public bool memcmp_r(int ofst,@NotNilptr byte [] pb){
        for (int i = pb.length - 1; i >= 0; i--){
            if (data[i + ofst] != pb[i]){
                return false;
            }
        }
        return true;
    }
    
    public int indexOf(@NotNilptr byte [] pb){
        for (int i = 0; i < length; i++){
            if (memcmp(i, pb)){
                return i;
            }
        }
        return -1;
    }
    
    public int indexOf(@NotNilptr byte [] pb, int ofst){
        for (int i = ofst; i < length; i++){
            if (memcmp(i, pb)){
                return i;
            }
        }
        return -1;
    }
    
    public int lastIndexOf(@NotNilptr byte [] pb){
        for (int i = length - 1; i >= 0; i--){
            if (memcmp_r(i, pb)){
                return i;
            }
        }
        return -1;
    }
    
    public int lastIndexOf(@NotNilptr byte [] pb, int ofst){
        for (int i = ofst - 1; i >= 0; i--){
            if (memcmp_r(i, pb)){
                return i;
            }
        }
        return -1;
    }
    
    
    public int indexOf(@NotNilptr String pb){
        return indexOf(pb.getBytes());
    }
    
    public int indexOf(@NotNilptr String pb, int ofst){
        return indexOf(pb.getBytes(), ofst);
    }
    
    public int lastIndexOf(@NotNilptr String pb){
        return lastIndexOf(pb.getBytes());
    }
    
    public int lastIndexOf(@NotNilptr String pb, int ofst){
        return lastIndexOf(pb.getBytes(), ofst);
    }
    
    public @NotNilptr String substring(int start, int end){
        return new String(data, start, end - start);
    }
    
    public int length(){
        return length;
    }
};