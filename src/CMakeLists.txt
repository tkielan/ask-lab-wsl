cmake_minimum_required(VERSION 3.16)

project(Whale CXX)

add_executable(Whale)

target_sources(Whale
    PRIVATE
        whale.cpp
)
