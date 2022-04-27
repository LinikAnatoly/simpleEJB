unit EditSealRegistriesForENWorkOrderByt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, Grids, AdvObj, BaseGrid, AdvGrid, InvokeRegistry,
  Rio, SOAPHTTPClient, StdCtrls, ActnList, Menus;

type
  TfrmSealRegistriesForENWorkOrderBytEdit = class(TDialogForm)
    sgSealsUsed: TAdvStringGrid;
    HTTPRIOSCSeal2ENWorkOrderByt: THTTPRIO;
    Label1: TLabel;
    Label2: TLabel;
    sgSealsUnused: TAdvStringGrid;
    Label3: TLabel;
    sgSealsSpoiled: TAdvStringGrid;
    ActionList1: TActionList;
    actMoveUsedToUnused: TAction;
    pmSealsUsed: TPopupMenu;
    N7: TMenuItem;
    actMoveUsedToSpoiled: TAction;
    pmSealsUnused: TPopupMenu;
    pmSealsSpoiled: TPopupMenu;
    N1: TMenuItem;
    actMoveUnusedToSpoiled: TAction;
    actRebindUnused: TAction;
    actMoveSpoiledToUnused: TAction;
    actRebindSpoiled: TAction;
    N2: TMenuItem;
    N3: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    btnCancel: TButton;
    lblSealsUsedCount: TLabel;
    lblSealsUnusedCount: TLabel;
    lblSealsSpoiledCount: TLabel;
    btnMoveUsedToUnused: TButton;
    btnMoveUsedToSpoiled: TButton;
    btnRebindUnused: TButton;
    btnMoveUnusedToSpoiled: TButton;
    btnRebindSpoiled: TButton;
    btnMoveSpoiledToUnused: TButton;
    HTTPRIOENWorkOrderByt: THTTPRIO;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actMoveUsedToUnusedExecute(Sender: TObject);
    procedure actMoveUsedToSpoiledExecute(Sender: TObject);
    procedure actMoveUnusedToSpoiledExecute(Sender: TObject);
    procedure actMoveSpoiledToUnusedExecute(Sender: TObject);
    procedure actRebindUnusedExecute(Sender: TObject);
    procedure actRebindSpoiledExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    workOrderBytCode: Integer;
    workOrderBytType: Integer;
    procedure UpdateSealsUsedList;
    procedure UpdateSealsUnusedList;
    procedure UpdateSealsSpoiledList;
  end;

var
  frmSealRegistriesForENWorkOrderBytEdit: TfrmSealRegistriesForENWorkOrderBytEdit;

implementation

uses ENConsts, SCSeal2ENWorkOrderBytController, GridHeadersUnit,
  ENWorkOrderBytController, SCSeal2WorkOrderBytKindController,
  ShowSCSeal2ENWorkOrderBytForFact, ChildFormUnit;

{$R *.dfm}

var
  SCSealsUsedHeaders: array [1..6] of String =
        ( 'Код'
          //,'Особ. рахунок'
          ,'Особ. рах. / № дог.'
          ,'ПІБ абонента'
          //,'Матеріал у плані'
          //,'Кількість у плані'
          ,'Серійний номер'
          ,'Найменування'
          ,'Інв. номер'
        );

  SCSealsUnusedHeaders: array [1..4] of String =
        ( 'Код'
          ,'Серійний номер'
          ,'Найменування'
          ,'Інв. номер'
        );

procedure TfrmSealRegistriesForENWorkOrderBytEdit.actMoveSpoiledToUnusedExecute(
  Sender: TObject);
var
  TempSCSeal2ENWorkOrderByt: SCSeal2ENWorkOrderBytControllerSoapPort;
  seal2WorkOrderBytCode: Integer;
begin
  try
    seal2WorkOrderBytCode := StrToInt(sgSealsSpoiled.Cells[0, sgSealsSpoiled.Row]);
  except
    on EConvertError do Exit;
  end;

  TempSCSeal2ENWorkOrderByt := HTTPRIOSCSeal2ENWorkOrderByt as SCSeal2ENWorkOrderBytControllerSoapPort;
  TempSCSeal2ENWorkOrderByt.moveSealToUnused(seal2WorkOrderBytCode);

  UpdateSealsSpoiledList;
  UpdateSealsUnusedList;
end;

procedure TfrmSealRegistriesForENWorkOrderBytEdit.actMoveUnusedToSpoiledExecute(
  Sender: TObject);
var
  TempSCSeal2ENWorkOrderByt: SCSeal2ENWorkOrderBytControllerSoapPort;
  seal2WorkOrderBytCode: Integer;
begin
  try
    seal2WorkOrderBytCode := StrToInt(sgSealsUnused.Cells[0, sgSealsUnused.Row]);
  except
    on EConvertError do Exit;
  end;

  TempSCSeal2ENWorkOrderByt := HTTPRIOSCSeal2ENWorkOrderByt as SCSeal2ENWorkOrderBytControllerSoapPort;
  TempSCSeal2ENWorkOrderByt.moveSealToSpoiled(seal2WorkOrderBytCode);

  UpdateSealsUnusedList;
  UpdateSealsSpoiledList;
end;

procedure TfrmSealRegistriesForENWorkOrderBytEdit.actMoveUsedToSpoiledExecute(
  Sender: TObject);
var
  TempSCSeal2ENWorkOrderByt: SCSeal2ENWorkOrderBytControllerSoapPort;
  seal2WorkOrderBytCode: Integer;
begin
  try
    seal2WorkOrderBytCode := StrToInt(sgSealsUsed.Cells[0, sgSealsUsed.Row]);
  except
    on EConvertError do Exit;
  end;

  TempSCSeal2ENWorkOrderByt := HTTPRIOSCSeal2ENWorkOrderByt as SCSeal2ENWorkOrderBytControllerSoapPort;
  TempSCSeal2ENWorkOrderByt.moveSealToSpoiled(seal2WorkOrderBytCode);

  UpdateSealsUsedList;
  UpdateSealsSpoiledList;
end;


procedure TfrmSealRegistriesForENWorkOrderBytEdit.actMoveUsedToUnusedExecute(
  Sender: TObject);
var
  TempSCSeal2ENWorkOrderByt: SCSeal2ENWorkOrderBytControllerSoapPort;
  seal2WorkOrderBytCode: Integer;
begin
  try
    seal2WorkOrderBytCode := StrToInt(sgSealsUsed.Cells[0, sgSealsUsed.Row]);
  except
    on EConvertError do Exit;
  end;

  TempSCSeal2ENWorkOrderByt := HTTPRIOSCSeal2ENWorkOrderByt as SCSeal2ENWorkOrderBytControllerSoapPort;
  TempSCSeal2ENWorkOrderByt.moveSealToUnused(seal2WorkOrderBytCode);

  UpdateSealsUsedList;
  UpdateSealsUnusedList;
end;

procedure TfrmSealRegistriesForENWorkOrderBytEdit.actRebindSpoiledExecute(
  Sender: TObject);
var
  frmSCSeal2ENWorkOrderBytForFactShow: TfrmSCSeal2ENWorkOrderBytForFactShow;
  TempSCSeal2ENWorkOrderByt: SCSeal2ENWorkOrderBytControllerSoapPort;
  seal2WorkOrderBytCode: Integer;
  estimateItemCodes, accountNumber, customerName: String;
begin
  try
    seal2WorkOrderBytCode := StrToInt(sgSealsSpoiled.Cells[0, sgSealsSpoiled.Row]);
  except
    on EConvertError do Exit;
  end;

  if workOrderBytType = LOW_INT then
    raise Exception.Create('Не задано тип Змінного завдання!');

  frmSCSeal2ENWorkOrderBytForFactShow := TfrmSCSeal2ENWorkOrderBytForFactShow.Create(Application, fmNormal);
  try
    frmSCSeal2ENWorkOrderBytForFactShow.workOrderBytCode := workOrderBytCode;
    frmSCSeal2ENWorkOrderBytForFactShow.sealTypeCode := Integer(sgSealsSpoiled.Objects[0, sgSealsSpoiled.Row]);

    if frmSCSeal2ENWorkOrderBytForFactShow.ShowModal = mrOk then
    begin
      estimateItemCodes := frmSCSeal2ENWorkOrderBytForFactShow.estimateItemCodes;

      TempSCSeal2ENWorkOrderByt := HTTPRIOSCSeal2ENWorkOrderByt as SCSeal2ENWorkOrderBytControllerSoapPort;

      if workOrderBytType = ENWORKORDERBYTTYPE_BY_ENERGYNET then
      begin
        TempSCSeal2ENWorkOrderByt.rebindSeal(seal2WorkOrderBytCode, estimateItemCodes);
      end
      else if workOrderBytType = ENWORKORDERBYTTYPE_RAID_BY_BILLING then
      begin
        accountNumber := frmSCSeal2ENWorkOrderBytForFactShow.GetReturnValue(frmSCSeal2ENWorkOrderBytForFactShow.sgSCSeal2ENWorkOrderByt, 2);
        customerName  := frmSCSeal2ENWorkOrderBytForFactShow.GetReturnValue(frmSCSeal2ENWorkOrderBytForFactShow.sgSCSeal2ENWorkOrderByt, 4);

        TempSCSeal2ENWorkOrderByt.rebindSealForRaid(seal2WorkOrderBytCode, estimateItemCodes, accountNumber, customerName);
      end
      else
        raise Exception.Create('Невідомий тип Змінного завдання!');

      UpdateSealsUsedList;
      UpdateSealsSpoiledList;
    end;
  finally
    frmSCSeal2ENWorkOrderBytForFactShow.Free;
  end;
end;

procedure TfrmSealRegistriesForENWorkOrderBytEdit.actRebindUnusedExecute(
  Sender: TObject);
var
  frmSCSeal2ENWorkOrderBytForFactShow: TfrmSCSeal2ENWorkOrderBytForFactShow;
  TempSCSeal2ENWorkOrderByt: SCSeal2ENWorkOrderBytControllerSoapPort;
  seal2WorkOrderBytCode: Integer;
  estimateItemCodes, accountNumber, customerName: String;
begin
  try
    seal2WorkOrderBytCode := StrToInt(sgSealsUnused.Cells[0, sgSealsUnused.Row]);
  except
    on EConvertError do Exit;
  end;

  if workOrderBytType = LOW_INT then
    raise Exception.Create('Не задано тип Змінного завдання!');

  frmSCSeal2ENWorkOrderBytForFactShow := TfrmSCSeal2ENWorkOrderBytForFactShow.Create(Application, fmNormal);
  try
    frmSCSeal2ENWorkOrderBytForFactShow.workOrderBytCode := workOrderBytCode;
    frmSCSeal2ENWorkOrderBytForFactShow.sealTypeCode := Integer(sgSealsUnused.Objects[0, sgSealsUnused.Row]);

    if frmSCSeal2ENWorkOrderBytForFactShow.ShowModal = mrOk then
    begin
      estimateItemCodes := frmSCSeal2ENWorkOrderBytForFactShow.estimateItemCodes;

      TempSCSeal2ENWorkOrderByt := HTTPRIOSCSeal2ENWorkOrderByt as SCSeal2ENWorkOrderBytControllerSoapPort;

      if workOrderBytType = ENWORKORDERBYTTYPE_BY_ENERGYNET then
      begin
        TempSCSeal2ENWorkOrderByt.rebindSeal(seal2WorkOrderBytCode, estimateItemCodes);
      end
      else if workOrderBytType = ENWORKORDERBYTTYPE_RAID_BY_BILLING then
      begin
        accountNumber := frmSCSeal2ENWorkOrderBytForFactShow.GetReturnValue(frmSCSeal2ENWorkOrderBytForFactShow.sgSCSeal2ENWorkOrderByt, 2);
        customerName  := frmSCSeal2ENWorkOrderBytForFactShow.GetReturnValue(frmSCSeal2ENWorkOrderBytForFactShow.sgSCSeal2ENWorkOrderByt, 4);

        TempSCSeal2ENWorkOrderByt.rebindSealForRaid(seal2WorkOrderBytCode, estimateItemCodes, accountNumber, customerName);
      end
      else
        raise Exception.Create('Невідомий тип Змінного завдання!');

      UpdateSealsUsedList;
      UpdateSealsUnusedList;
    end;
  finally
    frmSCSeal2ENWorkOrderBytForFactShow.Free;
  end;
end;

procedure TfrmSealRegistriesForENWorkOrderBytEdit.FormCreate(Sender: TObject);
begin
  workOrderBytCode := LOW_INT;
  workOrderBytType := LOW_INT;
end;

procedure TfrmSealRegistriesForENWorkOrderBytEdit.FormShow(Sender: TObject);
var
  TempENWorkOrderByt: ENWorkOrderBytControllerSoapPort;
  workOrderByt: ENWorkOrderByt;
begin
  SetGridHeaders(SCSealsUsedHeaders, sgSealsUsed.ColumnHeaders);
  SetGridHeaders(SCSealsUnusedHeaders, sgSealsUnused.ColumnHeaders);
  SetGridHeaders(SCSealsUnusedHeaders, sgSealsSpoiled.ColumnHeaders);

  DisableActions([actMoveUsedToUnused, actMoveUsedToSpoiled,
                  actMoveUnusedToSpoiled, actMoveSpoiledToUnused,
                  actRebindUnused, actRebindSpoiled]);

  if workOrderBytCode = LOW_INT then Exit;

  TempENWorkOrderByt := HTTPRIOENWorkOrderByt as ENWorkOrderBytControllerSoapPort;
  workOrderByt := TempENWorkOrderByt.getObject(workOrderBytCode);

  if workOrderByt.statusRef.code = ENWORKORDERBYTSTATUS_COMPLETED then
  begin
    DisableActions([actMoveUsedToUnused, actMoveUsedToSpoiled,
                    actMoveUnusedToSpoiled, actMoveSpoiledToUnused,
                    actRebindUnused, actRebindSpoiled], false);
  end;

  UpdateSealsUsedList;
  UpdateSealsUnusedList;
  UpdateSealsSpoiledList;
end;

procedure TfrmSealRegistriesForENWorkOrderBytEdit.UpdateSealsSpoiledList;
var
  TempSCSeal2ENWorkOrderByt: SCSeal2ENWorkOrderBytControllerSoapPort;
  i: Integer;
  seal2ENWorkOrderBytFilter: SCSeal2ENWorkOrderBytFilter;
  SCSeal2ENWorkOrderBytList: SCSeal2ENWorkOrderBytShortList;
begin
  ClearGrid(sgSealsSpoiled);

  lblSealsSpoiledCount.Caption := 'Усього:  0';

  if workOrderBytCode = LOW_INT then Exit;

  TempSCSeal2ENWorkOrderByt := HTTPRIOSCSeal2ENWorkOrderByt as SCSeal2ENWorkOrderBytControllerSoapPort;

  seal2ENWorkOrderBytFilter := SCSeal2ENWorkOrderBytFilter.Create;
  SetNullIntProps(seal2ENWorkOrderBytFilter);
  SetNullXSProps(seal2ENWorkOrderBytFilter);

  seal2ENWorkOrderBytFilter.workOrderBytRef := ENWorkOrderBytRef.Create;
  seal2ENWorkOrderBytFilter.workOrderBytRef.code := workOrderBytCode;

  seal2ENWorkOrderBytFilter.kindRef := SCSeal2WorkOrderBytKindRef.Create;
  seal2ENWorkOrderBytFilter.kindRef.code := SCSEAL2WORKORDERBYTKIND_FACT;

  seal2ENWorkOrderBytFilter.conditionSQL := 'SCSEAL2ENWORKORDERBYT.WORKORDERBYTITEMREFCOD is null and ' +
                                            'SCSEAL.STATUSREFCODE = ' + IntToStr(SCSEALSTATUS_SPOILED);
  seal2ENWorkOrderBytFilter.orderBySQL := 'SCSEAL.BUILDNUMBER';

  SCSeal2ENWorkOrderBytList := TempSCSeal2ENWorkOrderByt.getScrollableFilteredList(seal2ENWorkOrderBytFilter, 0, -1);

  if High(SCSeal2ENWorkOrderBytList.list) > -1 then
    sgSealsSpoiled.RowCount := High(SCSeal2ENWorkOrderBytList.list) + 2
  else
    sgSealsSpoiled.RowCount := 2;

  {
        ( 'Код'
          ,'Серійний номер'
          ,'Найменування'
          ,'Інв. номер'
        );
  }

  with sgSealsSpoiled do
    for i := 0 to High(SCSeal2ENWorkOrderBytList.list) do
    begin
      Application.ProcessMessages;

      if SCSeal2ENWorkOrderBytList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(SCSeal2ENWorkOrderBytList.list[i].code)
      else
        Cells[0,i+1] := '';

      Cells[1,i+1] := SCSeal2ENWorkOrderBytList.list[i].sealRefBuildNumber;
      //AddCheckBox(1, i+1, false, false);
      Cells[2,i+1] := SCSeal2ENWorkOrderBytList.list[i].sealRefName;
      Cells[3,i+1] := SCSeal2ENWorkOrderBytList.list[i].sealRefInvNumber;

      Objects[0,i+1] := TObject(SCSeal2ENWorkOrderBytList.list[i].sealRefTypeCode);

      sgSealsSpoiled.RowCount := i + 2;
    end;

   sgSealsSpoiled.Row := 1;

   lblSealsSpoiledCount.Caption := 'Усього:  ' + IntToStr(High(SCSeal2ENWorkOrderBytList.list) + 1);
end;

procedure TfrmSealRegistriesForENWorkOrderBytEdit.UpdateSealsUnusedList;
var
  TempSCSeal2ENWorkOrderByt: SCSeal2ENWorkOrderBytControllerSoapPort;
  i: Integer;
  seal2ENWorkOrderBytFilter: SCSeal2ENWorkOrderBytFilter;
  SCSeal2ENWorkOrderBytList: SCSeal2ENWorkOrderBytShortList;
begin
  ClearGrid(sgSealsUnused);

  lblSealsUnusedCount.Caption := 'Усього:  0';

  if workOrderBytCode = LOW_INT then Exit;

  TempSCSeal2ENWorkOrderByt := HTTPRIOSCSeal2ENWorkOrderByt as SCSeal2ENWorkOrderBytControllerSoapPort;

  seal2ENWorkOrderBytFilter := SCSeal2ENWorkOrderBytFilter.Create;
  SetNullIntProps(seal2ENWorkOrderBytFilter);
  SetNullXSProps(seal2ENWorkOrderBytFilter);

  seal2ENWorkOrderBytFilter.workOrderBytRef := ENWorkOrderBytRef.Create;
  seal2ENWorkOrderBytFilter.workOrderBytRef.code := workOrderBytCode;

  seal2ENWorkOrderBytFilter.kindRef := SCSeal2WorkOrderBytKindRef.Create;
  seal2ENWorkOrderBytFilter.kindRef.code := SCSEAL2WORKORDERBYTKIND_FACT;

  seal2ENWorkOrderBytFilter.conditionSQL := 'SCSEAL2ENWORKORDERBYT.WORKORDERBYTITEMREFCOD is null and ' +
                                            'SCSEAL.STATUSREFCODE = ' + IntToStr(SCSEALSTATUS_GOOD);
  seal2ENWorkOrderBytFilter.orderBySQL := 'SCSEAL.BUILDNUMBER';

  SCSeal2ENWorkOrderBytList := TempSCSeal2ENWorkOrderByt.getScrollableFilteredList(seal2ENWorkOrderBytFilter, 0, -1);

  if High(SCSeal2ENWorkOrderBytList.list) > -1 then
    sgSealsUnused.RowCount := High(SCSeal2ENWorkOrderBytList.list) + 2
  else
    sgSealsUnused.RowCount := 2;

  {
        ( 'Код'
          ,'Серійний номер'
          ,'Найменування'
          ,'Інв. номер'
        );
  }

  with sgSealsUnused do
    for i := 0 to High(SCSeal2ENWorkOrderBytList.list) do
    begin
      Application.ProcessMessages;

      if SCSeal2ENWorkOrderBytList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(SCSeal2ENWorkOrderBytList.list[i].code)
      else
        Cells[0,i+1] := '';

      Cells[1,i+1] := SCSeal2ENWorkOrderBytList.list[i].sealRefBuildNumber;
      //AddCheckBox(1, i+1, false, false);
      Cells[2,i+1] := SCSeal2ENWorkOrderBytList.list[i].sealRefName;
      Cells[3,i+1] := SCSeal2ENWorkOrderBytList.list[i].sealRefInvNumber;

      Objects[0,i+1] := TObject(SCSeal2ENWorkOrderBytList.list[i].sealRefTypeCode);

      sgSealsUnused.RowCount := i + 2;
    end;

   sgSealsUnused.Row := 1;

   lblSealsUnusedCount.Caption := 'Усього:  ' + IntToStr(High(SCSeal2ENWorkOrderBytList.list) + 1);
end;

procedure TfrmSealRegistriesForENWorkOrderBytEdit.UpdateSealsUsedList;
var
  TempSCSeal2ENWorkOrderByt: SCSeal2ENWorkOrderBytControllerSoapPort;
  i, eiCode: Integer;
  seal2ENWorkOrderBytFilter: SCSeal2ENWorkOrderBytFilter;
  SCSeal2ENWorkOrderBytList: SCSeal2ENWorkOrderBytShortList;
  accountNumber, tmpAccountNumber: String;
begin
  ClearGrid(sgSealsUsed);

  lblSealsUsedCount.Caption := 'Усього:  0';

  if workOrderBytCode = LOW_INT then Exit;

  TempSCSeal2ENWorkOrderByt := HTTPRIOSCSeal2ENWorkOrderByt as SCSeal2ENWorkOrderBytControllerSoapPort;

  seal2ENWorkOrderBytFilter := SCSeal2ENWorkOrderBytFilter.Create;
  SetNullIntProps(seal2ENWorkOrderBytFilter);
  SetNullXSProps(seal2ENWorkOrderBytFilter);

  seal2ENWorkOrderBytFilter.workOrderBytRef := ENWorkOrderBytRef.Create;
  seal2ENWorkOrderBytFilter.workOrderBytRef.code := workOrderBytCode;

  seal2ENWorkOrderBytFilter.kindRef := SCSeal2WorkOrderBytKindRef.Create;
  seal2ENWorkOrderBytFilter.kindRef.code := SCSEAL2WORKORDERBYTKIND_FACT;

  seal2ENWorkOrderBytFilter.conditionSQL := 'SCSEAL2ENWORKORDERBYT.WORKORDERBYTITEMREFCOD is not null and ' +
                                            'SCSEAL.STATUSREFCODE in (' + IntToStr(SCSEALSTATUS_GOOD) + ', ' + IntToStr(SCSEALSTATUS_INSTALLED) + ')';
  seal2ENWorkOrderBytFilter.orderBySQL := 'ENWORKORDERBYTITEM.ACCOUNTNUMBER, ENWORKORDERBYTITEM.contractnumberservices, /*ei.code,*/ SCSEAL.BUILDNUMBER';

  SCSeal2ENWorkOrderBytList := TempSCSeal2ENWorkOrderByt.getScrollableFilteredList(seal2ENWorkOrderBytFilter, 0, -1);

  if High(SCSeal2ENWorkOrderBytList.list) > -1 then
    sgSealsUsed.RowCount := High(SCSeal2ENWorkOrderBytList.list) + 2
  else
    sgSealsUsed.RowCount := 2;

  {
          ( 'Код'
          ,'Особ. рах. / № дог.'
          ,'ПІБ абонента'
          //,'Матеріал у плані'
          //,'Кількість у плані'
          ,'Серійний номер'
          ,'Найменування'
          ,'Інв. номер'
        );
  }

  tmpAccountNumber := '';
  //eiCode := LOW_INT;

  with sgSealsUsed do
    for i := 0 to High(SCSeal2ENWorkOrderBytList.list) do
    begin
      Application.ProcessMessages;

      if SCSeal2ENWorkOrderBytList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(SCSeal2ENWorkOrderBytList.list[i].code)
      else
        Cells[0,i+1] := '';

      if SCSeal2ENWorkOrderBytList.list[i].workOrderBytItemRefAccountNumber <> '' then
        accountNumber := SCSeal2ENWorkOrderBytList.list[i].workOrderBytItemRefAccountNumber
      else
        accountNumber := SCSeal2ENWorkOrderBytList.list[i].workOrderBytItemRefContractNumberServices;

      if accountNumber <> tmpAccountNumber then
      begin
        Cells[1,i+1] := accountNumber; //SCSeal2ENWorkOrderBytList.list[i].workOrderBytItemRefAccountNumber;
        Cells[2,i+1] := SCSeal2ENWorkOrderBytList.list[i].workOrderBytItemRefCustomerName;
        //accountNumber := SCSeal2ENWorkOrderBytList.list[i].workOrderBytItemRefAccountNumber;
        tmpAccountNumber := accountNumber;
      end
      else begin
        Cells[1,i+1] := '';
        Cells[2,i+1] := '';
      end;

      //AddCheckBox(1, i+1, false, false);

      {
      if SCSeal2ENWorkOrderBytList.list[i].estimateItemCode <> eiCode then
      begin
        Cells[3,i+1] := SCSeal2ENWorkOrderBytList.list[i].estimateItemMaterialName;

        if SCSeal2ENWorkOrderBytList.list[i].estimateItemCountFact = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := SCSeal2ENWorkOrderBytList.list[i].estimateItemCountFact.DecimalString;

        eiCode := SCSeal2ENWorkOrderBytList.list[i].estimateItemCode;
      end
      else begin
        Cells[3,i+1] := '';
        Cells[4,i+1] := '';
      end;
      }

      Cells[3,i+1] := SCSeal2ENWorkOrderBytList.list[i].sealRefBuildNumber;
      Cells[4,i+1] := SCSeal2ENWorkOrderBytList.list[i].sealRefName;
      Cells[5,i+1] := SCSeal2ENWorkOrderBytList.list[i].sealRefInvNumber;

      Objects[0,i+1] := TObject(SCSeal2ENWorkOrderBytList.list[i].estimateItemCode);

      sgSealsUsed.RowCount := i + 2;
    end;

  sgSealsUsed.Row := 1;

  lblSealsUsedCount.Caption := 'Усього:  ' + IntToStr(High(SCSeal2ENWorkOrderBytList.list) + 1);
end;

end.
