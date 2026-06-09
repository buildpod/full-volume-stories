// Pure entitlement logic. No Flutter imports allowed in the domain layer.
//
// Access model (FV-007):
//   - The first story in a pack is a free sample, always playable.
//   - Every other story requires the premium unlock.
//   - Premium unlocks everything.
bool isStoryUnlocked({required bool isPremium, required bool isFreeSample}) {
  return isPremium || isFreeSample;
}
