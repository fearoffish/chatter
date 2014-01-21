module ObserveEvents
  def observe_events(context)
    NSNotificationCenter.defaultCenter.addObserver(
      Hourly,
      selector: 'handleDataModelChange:',
      name: NSManagedObjectContextObjectsDidChangeNotification,
      object: context
    )
    NSNotificationCenter.defaultCenter.addObserver(
      Daily,
      selector: 'handleDataModelChange:',
      name: NSManagedObjectContextObjectsDidChangeNotification,
      object: context
    )
  end
end