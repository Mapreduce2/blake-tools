#!/bin/bash

#script to find large files in a few common places.

#!/bin/bash
 find /opt -type f -exec du -Sh {} + | sort -rh | head -n 25
  find /var -type f -exec du -Sh {} + | sort -rh | head -n 25
   find /home -type f -exec du -Sh {} + | sort -rh | head -n 25
    find /tmp -type f -exec du -Sh {} + | sort -rh | head -n 25
    find /tmp -type f -exec du -Sh {} + | sort -rh | head -n 25
    
    
