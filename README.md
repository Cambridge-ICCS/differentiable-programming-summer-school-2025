# Introduction to differentiable programming

*This course was developed for the
[2025 Summer School](https://iccs.cam.ac.uk/events/institute-computing-climate-science-annual-summer-school-2025)
of the
[Institute of Computing for Climate Science (ICCS)](https://iccs.cam.ac.uk) by
[Joe Wallwork](https://joewallwork.com) and
[Niccolò Zanotti](https://niccolozanotti.com).*

## Setup

The recommended approach for interacting with this course is to use GitHub
Codespaces.

1. Navigate to the [GitHub repo](https://github.com/Cambridge-ICCS/differentiable-programming-summer-school-2025)
   in a web browser.
2. Click the green Code button but switch to the Codespaces tab rather than the
   usual Local tab.
3. Click the green 'Create codespace on main' button. This will launch a new
   browser tab with an interactive VSCode session.

Once the container is set up you will be dropped into a VSCode session with
dependencies (Python, gfortran, and CMake) installed, and a copy of the workshop
repository cloned.

> [!NOTE]  
> Firefox users with enhanced tracking protection will need to disable this for
> the codespace.

Once the codespace has loaded, run the following command to install all
dependencies:
```sh
source install.sh
```
