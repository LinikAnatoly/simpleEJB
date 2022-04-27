
unit EditRQStorage2ENMol;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENConsts,
	  EnergyproController, EnergyproController2, RQStorage2ENMolController,
    RQStorageZoneController, RQStorage2ENMol2ZoneController ;

type
  TfrmRQStorage2ENMolEdit = class(TDialogForm)
  
  lblCode : TLabel;
	edtCode : TEdit;


  HTTPRIORQStorage2ENMol: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    lblRQStorageStorageName: TLabel;
    edtRQStorageStorageName: TEdit;
    spbRQStorageStorage: TSpeedButton;
    lblENMolName: TLabel;
    edtENMolName: TEdit;
    spbENMol: TSpeedButton;
    lblMolCode: TLabel;
    edtMolCode: TEdit;
    HTTPRIOENMol: THTTPRIO;
    HTTPRIORQStorage: THTTPRIO;
    sgRQStorageZone: TAdvStringGrid;
    Label1: TLabel;
    HTTPRIORQStorage2ENMol2Zone: THTTPRIO;
    HTTPRIORQStorageZone: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  procedure spbRQStorageStorageClick(Sender: TObject);
  procedure spbENMolClick(Sender: TObject);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmRQStorage2ENMolEdit: TfrmRQStorage2ENMolEdit;
  RQStorage2ENMolObj: RQStorage2ENMol;

implementation



uses ShowRQStorage, RQStorageController, ShowENMol, ENMolController, ENMolTypeController,
  ENMolStatusController;


{uses
    EnergyproController, EnergyproController2, RQStorage2ENMolController  ;
}
{$R *.dfm}

var
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQStorageZoneHeaders: array [1..5] of String =
        ( 'Код'
          ,'Найменування'
          ,'Опис'
          ,'МВО'
          ,'ознака доступності'
        );

        

procedure TfrmRQStorage2ENMolEdit.FormShow(Sender: TObject);
var
  i : Integer;
  TempENMol : ENMolControllerSoapPort;
  TempRQStorage : RQStorageControllerSoapPort;
  TempRQStorage2ENMol2Zone : RQStorage2ENMol2ZoneControllerSoapPort;
  RQStorage2ENMol2ZoneList : RQStorage2ENMol2ZoneShortList;
  storage2mol2zoneFilter : RQStorage2ENMol2ZoneFilter;

  TempRQStorageZone : RQStorageZoneControllerSoapPort;
  RQStorageZoneList : RQStorageZoneShortList;
  zoneFilter : RQStorageZoneFilter; 
begin

  SetGridHeaders(RQStorageZoneHeaders, sgRQStorageZone.ColumnHeaders);

  DisableControls([edtCode, edtMolCode]);

  if DialogState = dsView then
  begin
    DisableControls([spbRQStorageStorage, spbENMol]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DisableControls([edtENMolName, edtRQStorageStorageName]);
    DenyBlankValues([edtENMolName, edtRQStorageStorageName]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([edtRQStorageStorageName]);
  end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(RQStorage2ENMolObj.code);

    if RQStorage2ENMolObj.molRef <> nil then
    if RQStorage2ENMolObj.molRef.code <> low(Integer) then
    begin
      TempENMol := HTTPRIOENMol as ENMolControllerSoapPort;
      edtMolCode.Text := TempENMol.getObject(RQStorage2ENMolObj.molRef.code).finCode;
      edtENMolName.Text := TempENMol.getObject(RQStorage2ENMolObj.molRef.code).name;
    end;

    if RQStorage2ENMolObj.storageRef <> nil then
    if RQStorage2ENMolObj.storageRef.code <> low(Integer) then
    begin
      TempRQStorage := HTTPRIORQStorage as RQStorageControllerSoapPort;
      edtRQStorageStorageName.Text := TempRQStorage.getObject(RQStorage2ENMolObj.storageRef.code).name;
    end;

  end;

  if RQStorage2ENMolObj.storageRef <> nil then
  if RQStorage2ENMolObj.storageRef.code <> low(Integer) then
  begin
    TempRQStorage2ENMol2Zone := HTTPRIORQStorage2ENMol2Zone as RQStorage2ENMol2ZoneControllerSoapPort;

    storage2mol2zoneFilter := RQStorage2ENMol2ZoneFilter.Create;
    SetNullIntProps(storage2mol2zoneFilter);
    SetNullXSProps(storage2mol2zoneFilter);
    storage2mol2zoneFilter.conditionSQL := 'rqstoragezone.storagecode = ' + IntToStr(RQStorage2ENMolObj.storageRef.code);
    storage2mol2zoneFilter.orderBySQL := 'rqstoragezone.name';

    RQStorage2ENMol2ZoneList := TempRQStorage2ENMol2Zone.getScrollableFilteredList(storage2mol2zoneFilter,0,-1);

    if High(RQStorage2ENMol2ZoneList.list) > -1 then
      sgRQStorageZone.RowCount := High(RQStorage2ENMol2ZoneList.list)+2
    else
      sgRQStorageZone.RowCount := 2;

    with sgRQStorageZone do
      for i:=0 to High(RQStorage2ENMol2ZoneList.list) do
        begin
          Application.ProcessMessages;

          if (DialogState = dsInsert) then
          begin
            if (RQStorage2ENMol2ZoneList.list[i].molRefCode = Low(Integer)) then
              AddCheckBox(1, i+1, false, false);

            if (RQStorage2ENMol2ZoneList.list[i].molRefCode <> Low(Integer)) then
              RowColor[i+1] := clFuchsia;

          end else
          begin
            if ((RQStorage2ENMol2ZoneList.list[i].molRefCode = Low(Integer))
                  or (RQStorage2ENMolObj.molRef.code = RQStorage2ENMol2ZoneList.list[i].molRefCode)) then
            AddCheckBox(1, i+1, (RQStorage2ENMol2ZoneList.list[i].molRefCode <> Low(Integer)), false);

            if ((RQStorage2ENMol2ZoneList.list[i].molRefCode <> Low(Integer))
               and (RQStorage2ENMolObj.molRef.code <> RQStorage2ENMol2ZoneList.list[i].molRefCode)) then
            RowColor[i+1] := clFuchsia;
          end;


          if RQStorage2ENMol2ZoneList.list[i].zoneRefCode <> Low(Integer) then
            Cells[0,i+1] := IntToStr(RQStorage2ENMol2ZoneList.list[i].zoneRefCode)
          else
            Cells[0,i+1] := '';

          Cells[1,i+1] := RQStorage2ENMol2ZoneList.list[i].zoneRefName;
          Cells[2,i+1] := RQStorage2ENMol2ZoneList.list[i].zoneRefDescription;
          Cells[3,i+1] := RQStorage2ENMol2ZoneList.list[i].molRefName;

          Cells[4,i+1] := IntToStr(RQStorage2ENMol2ZoneList.list[i].isFree);

          LastRow:=i+1;
          sgRQStorageZone.RowCount:=LastRow+1;
        end;
    sgRQStorageZone.Row:=1;

  end;

end;



procedure TfrmRQStorage2ENMolEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var
  i : Integer;
  TempRQStorage2ENMol : RQStorage2ENMolControllerSoapPort;
  selected : Boolean;
  TempRQStorage2ENMol2Zone : RQStorage2ENMol2ZoneControllerSoapPort;
  RQStorage2ENMol2ZoneObj : RQStorage2ENMol2Zone;
  storage2mol2zoneFilter : RQStorage2ENMol2ZoneFilter;
  storage2mol2zoneList : RQStorage2ENMol2ZoneShortList;

begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([edtENMolName, edtRQStorageStorageName])  then
  begin
    Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
    Action:=caNone;
  end
  else

  begin

    selected := false;

    for i := 1 to sgRQStorageZone.RowCount - 1 do
    begin
      sgRQStorageZone.GetCheckBoxState(1, i, selected);
      if selected then break;
    end;

    if not selected then // Если не выбрана ни одна строка
    begin
      Application.MessageBox(PChar('Оберіть місця зберігання!!!'),
                             PChar('Увага!'), MB_ICONWARNING);
      Exit;
    end;

    selected := false;
    for i := 1 to sgRQStorageZone.RowCount - 1 do
    begin
      sgRQStorageZone.GetCheckBoxState(1, i, selected);
      if (not selected)
      then
      begin
        storage2mol2zoneFilter := RQStorage2ENMol2ZoneFilter.Create;
        SetNullIntProps(storage2mol2zoneFilter);
        SetNullXSProps(storage2mol2zoneFilter);

        storage2mol2zoneFilter.molRef := ENMolRef.Create;
        storage2mol2zoneFilter.molRef.code := RQStorage2ENMolObj.molRef.code;
        storage2mol2zoneFilter.storageRef := RQStorageRef.Create;
        storage2mol2zoneFilter.storageRef.code := RQStorage2ENMolObj.storageRef.code;
        storage2mol2zoneFilter.zoneRef := RQStorageZoneRef.Create;
        storage2mol2zoneFilter.zoneRef.code := StrToInt(sgRQStorageZone.Cells[0, i]);

        TempRQStorage2ENMol2Zone := HTTPRIORQStorage2ENMol2Zone as RQStorage2ENMol2ZoneControllerSoapPort;
        storage2mol2zoneList := TempRQStorage2ENMol2Zone.getScrollableFilteredList(storage2mol2zoneFilter, 0, -1);
        if (storage2mol2zoneList.totalCount > 0) then
           TempRQStorage2ENMol2Zone.remove(storage2mol2zoneList.list[0].code);
      end;
    end;

    selected := false;
    for i := 1 to sgRQStorageZone.RowCount - 1 do
    begin
      sgRQStorageZone.GetCheckBoxState(1, i, selected);

      if selected then
      begin
        TempRQStorage2ENMol2Zone := HTTPRIORQStorage2ENMol2Zone as RQStorage2ENMol2ZoneControllerSoapPort;
        RQStorage2ENMol2ZoneObj := RQStorage2ENMol2Zone.Create;
        RQStorage2ENMol2ZoneObj.molRef := ENMolRef.Create;
        RQStorage2ENMol2ZoneObj.molRef.code := RQStorage2ENMolObj.molRef.code;
        RQStorage2ENMol2ZoneObj.storageRef := RQStorageRef.Create;
        RQStorage2ENMol2ZoneObj.storageRef.code := RQStorage2ENMolObj.storageRef.code;
        RQStorage2ENMol2ZoneObj.zoneRef := RQStorageZoneRef.Create;
        RQStorage2ENMol2ZoneObj.zoneRef.code := StrToInt(sgRQStorageZone.Cells[0, i]);

        TempRQStorage2ENMol2Zone.add(RQStorage2ENMol2ZoneObj);

      end;

    end;


    TempRQStorage2ENMol := HTTPRIORQStorage2ENMol as RQStorage2ENMolControllerSoapPort;

    if DialogState = dsInsert then
    begin
      RQStorage2ENMolObj.code:=low(Integer);
      TempRQStorage2ENMol.add(RQStorage2ENMolObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQStorage2ENMol.save(RQStorage2ENMolObj);
    end;
  end;
end;


procedure TfrmRQStorage2ENMolEdit.spbRQStorageStorageClick(Sender: TObject);
var
   frmRQStorageShow : TfrmRQStorageShow;
begin
   frmRQStorageShow := TfrmRQStorageShow.Create(Application,fmNormal);
   try
      with frmRQStorageShow do
        if ShowModal = mrOk then
        begin
            try
               if RQStorage2ENMolObj.storageRef = nil then RQStorage2ENMolObj.storageRef := RQStorageRef.Create();
               RQStorage2ENMolObj.storageRef.code := StrToInt(GetReturnValue(sgRQStorage,0));
               edtRQStorageStorageName.Text := GetReturnValue(sgRQStorage,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmRQStorageShow.Free;
   end;
end;


procedure TfrmRQStorage2ENMolEdit.spbENMolClick(Sender: TObject);
var
   frmENMolShow : TfrmENMolShow;
   molFilter : ENMolFilter;
begin

   molFilter := ENMolFilter.Create;
   SetNullIntProps(molFilter);
   SetNullXSProps(molFilter);
   molFilter.typeRef := ENMolTypeRef.Create;
   molFilter.typeRef.code := ENMOLTYPE_STOREKEEPER_CENTRAL;
   molFilter.statusRef := ENMolStatusRef.Create;
   molFilter.statusRef.code := ENMOLSTATUS_ACTIVE;

   frmENMolShow := TfrmENMolShow.Create(Application,fmNormal,molFilter);

   frmENMolShow.isStorage := True;

   try
      frmENMolShow.DisableActions([frmENMolShow.actInsert, frmENMolShow.actDelete, frmENMolShow.actEdit]);
      
      with frmENMolShow do
        if ShowModal = mrOk then
        begin
            try
               if RQStorage2ENMolObj.molRef = nil then RQStorage2ENMolObj.molRef := ENMolRef.Create();
               RQStorage2ENMolObj.molRef.code := StrToInt(GetReturnValue(sgENMol,0));
               edtMolCode.Text := GetReturnValue(sgENMol,1);
               edtENMolName.Text := GetReturnValue(sgENMol,2);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENMolShow.Free;
   end;
end;

end.