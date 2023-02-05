/*
  Warnings:

  - You are about to alter the column `week_day` on the `habit_week_days` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `Int`.
  - You are about to drop the `day_unique` table. If the table is not empty, all the data it contains will be lost.

*/
-- AlterTable
ALTER TABLE `habit_week_days` MODIFY `week_day` INTEGER NOT NULL;

-- DropTable
DROP TABLE `day_unique`;

-- CreateTable
CREATE TABLE `day_habits` (
    `id` VARCHAR(191) NOT NULL,
    `day_id` VARCHAR(191) NOT NULL,
    `habit_id` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `day_habits_day_id_habit_id_key`(`day_id`, `habit_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `habit_week_days` ADD CONSTRAINT `habit_week_days_habit_id_fkey` FOREIGN KEY (`habit_id`) REFERENCES `habits`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `day_habits` ADD CONSTRAINT `day_habits_day_id_fkey` FOREIGN KEY (`day_id`) REFERENCES `days`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `day_habits` ADD CONSTRAINT `day_habits_habit_id_fkey` FOREIGN KEY (`habit_id`) REFERENCES `habits`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
