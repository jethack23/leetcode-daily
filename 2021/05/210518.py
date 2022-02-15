class Solution:
    def findDuplicate(self, paths: List[str]) -> List[List[str]]:
        mem = {}
        duplicate_contents = set()
        for path in paths:
            path = path.split(" ")
            folder = path[0]
            files = path[1:]
            for file in files:
                file_path, contents = file.split("(")
                file_path = folder + "/" + file_path
                if contents in mem:
                    mem[contents].append(file_path)
                    duplicate_contents.add(contents)
                else:
                    mem[contents] = [file_path]
        ret = []
        for contents in duplicate_contents:
            ret.append(mem[contents])
        return ret
