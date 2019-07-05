typedef enum Desk_platform_processor
{
 Desk_platform_ARM3   , 
 Desk_platform_ARM600 ,
 Desk_platform_ARM610 ,
 Desk_platform_ARM700 ,
 Desk_platform_ARM710 ,
 Desk_platform_ARM7500,
 Desk_platform_ARM710a,
 Desk_platform_ARM7500FE,
 Desk_platform_ARM710T,
 Desk_platform_ARM720T,
 Desk_platform_ARM740T,
 Desk_platform_ARM800 ,
 Desk_platform_ARM810 ,
 Desk_platform_ARM920T,
 Desk_platform_ARM940T,
 Desk_platform_SA110
} Desk_platform_processor;
typedef struct Desk_platform_data
{
 double osversion;
 enum
 {
  Desk_platform_ARCHIMEDES,
  Desk_platform_RISCPC,
  Desk_platform_A7000,
  Desk_platform_A7000plus,
  Desk_platform_RISCSTATION,
  Desk_platform_KINETIC,
  Desk_platform_MICRODIGITAL
 } machine;
 Desk_platform_processor processor;
 char processorname[14];
} Desk_platform_data;
int Desk_Platform_GetInfo(struct Desk_platform_data *platform);
