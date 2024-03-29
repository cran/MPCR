library(MPCR)


a <- matrix(c(1.21, 0.18, 0.13, 0.41, 0.06, 0.23,
              0.18, 0.64, 0.10, -0.16, 0.23, 0.07,
              0.13, 0.10, 0.36, -0.10, 0.03, 0.18,
              0.41, -0.16, -0.10, 1.05, -0.29, -0.08,
              0.06, 0.23, 0.03, -0.29, 1.71, -0.10,
              0.23, 0.07, 0.18, -0.08, -0.10, 0.36), 6, 6)
b <- c("double", "double", "double", "double",
       "double", "double", "double", "double",
       "double")


test_mat <- new(MPCRTile, 6, 6, 2, 2, a, b)

# Get Tile return a deep copy of the original tile
tile_temp <- MPCRTile.GetTile(matrix = test_mat, row = 1, col = 1)
tile_temp$PrintValues()
serialized <- MPCR.Serialize(tile_temp)
tile_deserialized <- MPCR.DeSerialize(serialized)
tile_deserialized$PrintValues()

# Get Serialized Tile return a serialized version of tile without creating any new copies
tile_temp_serialized<- MPCRTile.GetSerializedTile(matrix = test_mat, row = 1, col = 1)
tile_deserialized <- MPCR.DeSerialize(tile_temp_serialized)
tile_deserialized$PrintValues()

