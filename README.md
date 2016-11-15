# set_max_map_count
image for ensuring that the kernel setting vm.map_max_count is the minimum value for running elasticsearch

This image is intended to be used as a pre-container for an elasticsearch:5.0 or greater image.  elasticsearch v5.0
added bootstrap checks that demand a certain number of memory maps due to its high number of mmap calls.  This could
easily be modified to run as a side car container instead if we want to ensure that the map count doesn't get reset
lower.  