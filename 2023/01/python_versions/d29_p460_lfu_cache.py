class Node:
    def __init__(self, key=None, val=None):
        self.next = None
        self.prev = None
        self.key = key
        self.val = val
        self.f = 1
        return None


class BiLinkedList:
    def __init__(self):
        self.alpha_omega = Node()
        self.alpha_omega.prev = self.alpha_omega
        self.alpha_omega.next = self.alpha_omega
        self.size = 0
        return None

    def append(self, node):
        node.prev = self.alpha_omega.prev
        self.alpha_omega.prev.next = node
        self.alpha_omega.prev = node
        node.next = self.alpha_omega
        self.size += 1

    def pop(self, node=None):
        rst = node if node else self.alpha_omega.next
        rst.prev.next = rst.next
        rst.next.prev = rst.prev
        self.size -= 1
        return rst


class LFUCache:
    def __init__(self, capacity):
        self.freqs = defaultdict(BiLinkedList)
        self.cache = {}
        self.minf = 0
        self.capacity = capacity
        return None

    def __getitem__(self, key):
        node = self.cache[key]
        self.freqs[node.f].pop(node)
        if self.minf == node.f and self.freqs[node.f].size == 0:
            self.minf += 1
            _hy_anon_var_1 = None
        else:
            _hy_anon_var_1 = None
        node.f += 1
        self.freqs[node.f].append(node)
        return node

    def get(self, key):
        return self[key].val if key in self.cache else -1

    def put(self, key, value):
        if key in self.cache:
            self[key].val = value
            _hy_anon_var_5 = None
        else:
            if self.capacity == 0 and (not self.cache):
                _hy_anon_var_4 = None
            else:
                if True:
                    if self.capacity > 0:
                        self.capacity -= 1
                        _hy_anon_var_2 = None
                    else:
                        _hy_anon_var_2 = self.cache.pop(self.freqs[self.minf].pop().key)
                    self.minf = 1
                    node = Node(key, value)
                    self.cache[key] = node
                    _hy_anon_var_3 = self.freqs[1].append(node)
                else:
                    _hy_anon_var_3 = None
                _hy_anon_var_4 = _hy_anon_var_3
            _hy_anon_var_5 = _hy_anon_var_4
        return _hy_anon_var_5
