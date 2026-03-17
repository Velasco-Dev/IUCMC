import sys
import os
import heapq


def read_matrix(path):
    mat = []
    with open(path, encoding='utf-8') as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            parts = [p for p in line.split(',') if p != '']
            row = [int(x) for x in parts]
            mat.append(row)
    return mat


class DSU:
    def __init__(self, n):
        self.p = list(range(n))
    def find(self, x):
        while self.p[x] != x:
            self.p[x] = self.p[self.p[x]]
            x = self.p[x]
        return x
    def union(self, a, b):
        ra, rb = self.find(a), self.find(b)
        if ra == rb:
            return False
        self.p[rb] = ra
        return True


def kruskal_mst(n, edges):
    edges_sorted = sorted(edges, key=lambda e: e[0])
    dsu = DSU(n)
    mst = []
    total = 0
    for w,u,v in edges_sorted:
        if dsu.union(u,v):
            mst.append((u,v,w))
            total += w
            if len(mst) == n-1:
                break
    return mst, total


def build_adj_from_edges(n, edges):
    adj = [[] for _ in range(n)]
    for u,v,w in edges:
        adj[u].append((v,w))
        adj[v].append((u,w))
    return adj


def max_edge_on_path(adj, src, dst):
    n = len(adj)
    seen = [False]*n
    stack = [(src, 0)]  # node, max_so_far
    max_so = {src: 0}
    while stack:
        u, curmax = stack.pop()
        if seen[u]:
            continue
        seen[u] = True
        if u == dst:
            return curmax
        for v,w in adj[u]:
            if not seen[v]:
                max_so[v] = max(curmax, w)
                stack.append((v, max_so[v]))
    return None


def mst_unique(n, mst_edges, all_edges):
    mst_set = set()
    for u,v,w in mst_edges:
        a,b = min(u,v), max(u,v)
        mst_set.add((a,b,w))
    adj = build_adj_from_edges(n, mst_edges)
    for w,u,v in all_edges:
        a,b = min(u,v), max(u,v)
        if (a,b,w) in mst_set:
            continue
        max_on_path = max_edge_on_path(adj, u, v)
        if max_on_path is None:
            continue
        if max_on_path == w:
            return False
    return True


def dijkstra(n, adj, src=0):
    INF = 10**18
    dist = [INF]*n
    parent = [-1]*n
    dist[src] = 0
    pq = [(0, src)]
    while pq:
        d,u = heapq.heappop(pq)
        if d!=dist[u]:
            continue
        for v,w in adj[u]:
            nd = d + w
            if nd < dist[v]:
                dist[v] = nd
                parent[v] = u
                heapq.heappush(pq, (nd, v))
    return dist, parent


def main():
    path = os.path.join(os.path.dirname(__file__), 'MatrizAdyacenciaConPesos.txt')
    if len(sys.argv) > 1:
        path = sys.argv[1]
    mat = read_matrix(path)
    nrows = len(mat)
    if nrows == 0:
        print('Archivo vacío o sin filas válidas')
        return
    ncols = len(mat[0])
    n = min(nrows, ncols)
    # ensure at least first n rows have >= n cols
    for i in range(n):
        if len(mat[i]) < n:
            print('Fila', i, 'tiene longitud menor que n=', n)
            return
    # trim to n x n
    mat2 = [row[:n] for row in mat[:n]]
    print('Usando matriz de tamaño n =', n)

    edges = []
    for i in range(n):
        for j in range(i+1, n):
            w = mat2[i][j]
            if w != 0:
                edges.append((w, i, j))

    print('Aristas detectadas:', len(edges))

    mst_edges, total = kruskal_mst(n, edges)
    print('MST peso total:', total)
    unique = mst_unique(n, mst_edges, edges)
    print('¿MST único?', 'Sí' if unique else 'No')

    adj_all = build_adj_from_edges(n, edges)
    dist, parent = dijkstra(n, adj_all, 0)
    reachable = sum(1 for d in dist if d < 10**18)
    print('Nodos alcanzables desde 0:', reachable, '/', n)

    # Print some MST edges summary
    print('\nPrimeras 20 aristas MST:')
    for u,v,w in mst_edges[:20]:
        print(u, v, w)

if __name__ == '__main__':
    main()
