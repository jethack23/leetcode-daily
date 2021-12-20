class Codec:
    def __init__(self):
        self.cnt = 0
        self.idx2url = {}
        self.url2idx = {}
        self.chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"

    def idx2key(self, idx):
        ret = ""
        while idx:
            ret = idx % 62 + ret
            idx //= 62
        return ret

    def key2idx(self, key):
        ret = 0
        while key:
            ret += self.chars.find(key[0])
            ret *= 62
            key = key[1:]
        return ret

    def encode(self, longUrl: str) -> str:
        """Encodes a URL to a shortened URL.
        """
        key = None
        if longUrl in self.url2idx:
            key = self.idx2key(self.url2idx[longUrl])
        else:
            self.idx2url[self.cnt] = longUrl
            self.url2idx[longUrl] = self.cnt
            key = self.idx2key(self.cnt)
            self.cnt += 1

        return "http://tinyurl.com/" + key

    def decode(self, shortUrl: str) -> str:
        """Decodes a shortened URL to its original URL.
        """
        return self.idx2url[self.key2idx(shortUrl[19:])]


# Your Codec object will be instantiated and called as such:
# codec = Codec()
# codec.decode(codec.encode(url))
