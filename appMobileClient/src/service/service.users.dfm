object DMService: TDMService
  OldCreateOrder = False
  Height = 119
  Width = 216
  object FDMQryUsers: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 48
    Top = 32
    object FDMQryUsersCOD_USER: TIntegerField
      FieldName = 'COD_USER'
      Origin = 'COD_USER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDMQryUsersNOME_USER: TStringField
      FieldName = 'NOME_USER'
      Origin = 'NOME_USER'
      Size = 30
    end
    object FDMQryUsersLOGIN_USER: TStringField
      FieldName = 'LOGIN_USER'
      Origin = 'LOGIN_USER'
      Size = 30
    end
    object FDMQryUsersSENHA_USER: TStringField
      FieldName = 'SENHA_USER'
      Origin = 'SENHA_USER'
    end
  end
end
