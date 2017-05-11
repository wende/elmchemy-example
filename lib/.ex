
# Compiled using Elmchemy v0.0.30
defmodule Elmchemy do
  use Elmchemy

  @doc """
 
  Module to help express some Elixir related types and calls that wouldn't otherwise be possible
  
  @docs lffi, ffi, flambda, tryCatch
  
 
  """
  @doc """
 
  Function to make a direct Elixir local call. Takes a local function name
  and a tuple or single value of arguments
  
  
      iex> use Elmchemy
      iex> import Elmchemy
      iex> to_string(1)
      "1"
  
 
  """
  @spec lffi(String.t) :: any
  @spec lffi() :: (String.t -> any)
  def lffi() do
    Debug.crash.("You can't call local ffi in a browser")
  end

  @doc """
 
  Function to make a direct Elixir remote call. Takes a module name, a function name
  and a tuple or single value of arguments
  
  
      iex> use Elmchemy
      iex> import Elmchemy
      iex> Enum.sum([1, 2, 3])
      6
  
 
  """
  @spec ffi(String.t, String.t) :: any
  @spec ffi() :: (String.t -> (String.t -> any))
  curry ffi/2
  def ffi(m, f) do
    Debug.crash.("You can't use ffi in a browser")
  end

  @doc """
 
  Produce multiple argument anonymous function out of regular elm function.
  
      flambda 2 fun --> fn x1, x2 -> fun.(x1).(x2) end
  
 
  """
  @spec flambda(integer, any) :: any
  @spec flambda() :: (integer -> (any -> any))
  curry flambda/2
  def flambda(arity, f) do
    Debug.crash.("You can't use foreign lambda in a browser")
  end

  @doc """
 
  Wrap a function call in try catch returning Result based on wether the function throwed an error
  
  
      iex> use Elmchemy
      iex> import Elmchemy
      iex> try_catch.(String.to_integer("a"))
      {:error, "argument error"}
  
 
  """
  @spec try_catch((no_return -> any)) :: Elmchemy.XResult.result
  @spec try_catch() :: ((no_return -> any) -> Elmchemy.XResult.result)
  curry try_catch/1
  def try_catch(a) do
    Debug.crash.("You can't use 'try' in a browser")
  end

end
