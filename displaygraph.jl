using LinearAlgebra
using Arpack
using SparseArrays

function displaygraph(A,xy,grayscale::Float64=.6)
    f = plot(axis = false,grid = false, xaxis = false, yaxis = false, xticks = false, yticks = false)
    ei,ej,w = findnz(triu(A))
    lx = [xy[ei,1]';xy[ej,1]';NaN*ones(1,length(ei))]
    ly = [xy[ei,2]';xy[ej,2]';NaN*ones(1,length(ei))]
    for i = 1:length(w)
        plot!(f,lx[:,i],ly[:,i],color = RGB(grayscale,grayscale,grayscale),label = "", linewidth = 1)
    end
    scatter!(f,xy[:,1],xy[:,2],color = RGB(grayscale,grayscale,grayscale),markerstrokecolor =  RGB(grayscale,grayscale,grayscale),label = "")
    return f
end

function getxyspectral(A)
    d = sum(A,dims=2)
    n = size(A,1)
    Dhalf = spzeros(n,n)
    for i = 1:n
        Dhalf[i,i] = 1/sqrt(d[i])
    end
    Dhalf = sparse(Dhalf)
    L = LinearAlgebra.I-Dhalf*A*Dhalf
    E,V = eigs(L+n*I;nev = 3,which=:SM)
    xy = V[:,2:3]
    return xy
end


using PyCall
using Conda
using Random
const igraph = pyimport_conda("igraph","python-igraph","conda-forge")
const pyrandom = pyimport("random")
function igraph_layout(A::SparseMatrixCSC{T}, layoutname::AbstractString="fr";
    random::Bool=true) where T
    ei,ej,ew = findnz(A)
    edgelist = [(ei[i]-1,ej[i]-1) for i = 1:length(ei)]
    nverts = size(A)
    G = igraph.Graph(nverts, edges=edgelist, directed=false)
    if random
      xy = G.layout(layoutname)
    else
      pyrngstate = pyrandom.getstate()
      pyrandom.seed(0)
      xy = G.layout(layoutname)
      pyrandom.setstate(pyrngstate)
    end
    xy = [Float64(xy[i][j]) for i in 1:length(xy),  j in 1:length(xy[1])]
end