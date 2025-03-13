# ox_repairkit  

A simple vehicle repair script using **ox_lib, ox_inventory, and ox_target**. No unnecessary extras—just a smooth and functional repair system with animations, a progress bar, and proper item usage.  

## Features  
- Uses **ox_lib** for progress bars and notifications  
- **ox_inventory** for item checks and removal  
- **ox_target** for easy interaction with vehicles  
- Only allows repairs if you have a repair kit  
- Automatically opens the hood during repairs  
- Prevents repairing if the vehicle is already in perfect condition  

## Requirements  
- [ox_lib](https://github.com/overextended/ox_lib)  
- [ox_inventory](https://github.com/overextended/ox_inventory)  
- [ox_target](https://github.com/overextended/ox_target)  

## Installation  
1. Download or clone the repository  
2. Add `ox_repairkit` to your `resources` folder  
3. Ensure it in your `server.cfg`:  
   ```cfg
   ensure ox_repairkit
   ```

## Configuration
Edit the `config.lua` file to adjust settings:

```lua
Config.Item = 'repairkit' -- Item required for repairs (ox_inventory)
Config.ProgressDuration = 8000 -- Repair duration in milliseconds (8 seconds)
```

## Usage
- Approach a damaged vehicle.
- Aim at the engine/bonnet and interact using **ox_target**.
- If you have a repair kit, the repair process will start.
- The vehicle hood will open, and the repair will take **8 seconds**.
- The repair kit is consumed after a successful repair.
