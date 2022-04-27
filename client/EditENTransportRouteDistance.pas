
unit EditENTransportRouteDistance;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTransportRouteDistanceController,
  TB2Item, TB2Dock, TB2Toolbar,ENTransportRouteDistance2TKFuelKoefController,
  ShowTKFuelKoef, TKFuelKoefController, TKFuelKoefTypeController, ENConsts,
  AdvObj;

type
  TfrmENTransportRouteDistanceEdit = class(TDialogForm)


  HTTPRIOENTransportRouteDistance: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    pcEditENTransportRouteDistance: TPageControl;
    tsTransportRouteDistance: TTabSheet;
    tsENTransportRouteDistance2TKFuelKoef: TTabSheet;
    lblDistance: TLabel;
    edtDistance: TEdit;
    lblKoef: TLabel;
    edtKoef: TEdit;
    edtCode: TEdit;
    lblCode: TLabel;
    TBToolbar3: TTBToolbar;
    TBItem9: TTBItem;
    TBItem10: TTBItem;
    TBItem13: TTBItem;
    sgENTransportRouteDistance2TKFuelKoef: TAdvStringGrid;
    ImageList1: TImageList;
    ActionList1: TActionList;
    actInsert: TAction;
    actDelete: TAction;
    actUpdate: TAction;
    HTTPRIOENTransportRouteDistance2TKFuelKoef: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actInsertExecute(Sender: TObject);
    procedure updateKoefGrid();
    procedure actDeleteExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure pcEditENTransportRouteDistanceChange(Sender: TObject);

  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENTransportRouteDistanceEdit: TfrmENTransportRouteDistanceEdit;
  ENTransportRouteDistanceObj: ENTransportRouteDistance;


      ENTransportRouteDistance2TKFuelKoefHeaders: array [1..3] of String =
        ( 'Код'
		  , 'Найменування'
		  , 'Коефіціент'
        );

implementation


{uses  
    EnergyproController, EnergyproController2, ENTransportRouteDistanceController  ;
}
{$R *.dfm}



procedure TfrmENTransportRouteDistanceEdit.FormShow(Sender: TObject);

begin


  pcEditENTransportRouteDistance.ActivePage := tsTransportRouteDistance;

  if (DialogState = dsInsert) then begin
    HideControls([lblCode, edtCode]);
    edtKoef.Text := '1';
    edtDistance.Text := '0';
    tsENTransportRouteDistance2TKFuelKoef.TabVisible := False;
  end;

  DisableControls([edtKoef, edtCode]);

  if DialogState = dsView then
  begin
    DisableActions([actInsert, actDelete]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtDistance
      ,edtKoef
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENTransportRouteDistanceObj.code);
    if ( ENTransportRouteDistanceObj.distance <> nil ) then
       edtDistance.Text := ENTransportRouteDistanceObj.distance.decimalString
    else
       edtDistance.Text := ''; 
    if ( ENTransportRouteDistanceObj.koef <> nil ) then
       edtKoef.Text := ENTransportRouteDistanceObj.koef.decimalString
    else
       edtKoef.Text := '';


  end;
end;




procedure TfrmENTransportRouteDistanceEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTransportRouteDistance: ENTransportRouteDistanceControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtDistance
      ,edtKoef
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENTransportRouteDistance := HTTPRIOENTransportRouteDistance as ENTransportRouteDistanceControllerSoapPort;


     if (ENTransportRouteDistanceObj.distance = nil ) then
       ENTransportRouteDistanceObj.distance := TXSDecimal.Create;
     if edtDistance.Text <> '' then
       ENTransportRouteDistanceObj.distance.decimalString := edtDistance.Text 
     else
       ENTransportRouteDistanceObj.distance := nil;

     if (ENTransportRouteDistanceObj.koef = nil ) then
       ENTransportRouteDistanceObj.koef := TXSDecimal.Create;
     if edtKoef.Text <> '' then
       ENTransportRouteDistanceObj.koef.decimalString := edtKoef.Text 
     else
       ENTransportRouteDistanceObj.koef := nil;

    if DialogState = dsInsert then
    begin
      ENTransportRouteDistanceObj.code:=low(Integer);
      TempENTransportRouteDistance.add(ENTransportRouteDistanceObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENTransportRouteDistance.save(ENTransportRouteDistanceObj);
    end;
  end;
end;


procedure TfrmENTransportRouteDistanceEdit.actInsertExecute(
  Sender: TObject);
var
  TempENTransportRouteDistance2TKFuelKoef : ENTransportRouteDistance2TKFuelKoefControllerSoapPort;
  TempENTransportRouteDistance : ENTransportRouteDistanceControllerSoapPort;
  ENTransportRouteDistance2TKFuelKoefObj : ENTransportRouteDistance2TKFuelKoef;
  TKFuelKoefFilterObj : TKFuelKoefFilter;
  objCode : Integer;
  frmTKFuelKoefShow :  TfrmTKFuelKoefShow;
begin
  inherited;

  if ENTransportRouteDistanceObj.code = Low(Integer) then Exit;

  ENTransportRouteDistance2TKFuelKoefObj := ENTransportRouteDistance2TKFuelKoef.Create;
  ENTransportRouteDistance2TKFuelKoefObj.transportRouteDistanceRef := ENTransportRouteDistanceRef.Create;
  ENTransportRouteDistance2TKFuelKoefObj.transportRouteDistanceRef.code := ENTransportRouteDistanceObj.code;

  TKFuelKoefFilterObj := TKFuelKoefFilter.Create;
  SetNullXSProps(TKFuelKoefFilterObj);
  SetNullIntProps(TKFuelKoefFilterObj);
  TKFuelKoefFilterObj.tkFuelKoefTypeRef := TKFuelKoefTypeRef.Create;
  TKFuelKoefFilterObj.tkFuelKoefTypeRef.code :=  TKFUELKOEFTYPE_TRAVELSHEETITEM;

  frmTKFuelKoefShow := TfrmTKFuelKoefShow.Create(Application, fmNormal, TKFuelKoefFilterObj);
  try
      with frmTKFuelKoefShow do
      begin
        DisableActions([ actNoFilter, actDelete, actFilter, actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               objCode := StrToInt(GetReturnValue(sgTKFuelKoef,0));;
            except
               on EConvertError do Exit;
            end;

            ENTransportRouteDistance2TKFuelKoefObj.tkFuelKoefRef := TKFuelKoefRef.Create;
            ENTransportRouteDistance2TKFuelKoefObj.tkFuelKoefRef.code := objCode;

            TempENTransportRouteDistance2TKFuelKoef := HTTPRIOENTransportRouteDistance2TKFuelKoef as ENTransportRouteDistance2TKFuelKoefControllerSoapPort;
            TempENTransportRouteDistance2TKFuelKoef.add(ENTransportRouteDistance2TKFuelKoefObj);
            TempENTransportRouteDistance := HTTPRIOENTransportRouteDistance as ENTransportRouteDistanceControllerSoapPort;
            edtKoef.Text := TempENTransportRouteDistance.getAggregateSumOfKoefs(ENTransportRouteDistanceObj.code).DecimalString;
        end;
      end;
        updateKoefGrid();
   finally
      frmTKFuelKoefShow.Free;
   end;
end;

procedure TfrmENTransportRouteDistanceEdit.updateKoefGrid();
var
  TempENTransportRouteDistance2TKFuelKoef: ENTransportRouteDistance2TKFuelKoefControllerSoapPort;
  i, LastCount, LastRow : Integer;
  ENTransportRouteDistance2TKFuelKoefList: ENTransportRouteDistance2TKFuelKoefShortList;
  tsid2fkFilter : ENTransportRouteDistance2TKFuelKoefFilter;
  begin
  ClearGrid(sgENTransportRouteDistance2TKFuelKoef);
  SetGridHeaders(ENTransportRouteDistance2TKFuelKoefHeaders, sgENTransportRouteDistance2TKFuelKoef.ColumnHeaders);
  TempENTransportRouteDistance2TKFuelKoef :=  HTTPRIOENTransportRouteDistance2TKFuelKoef as ENTransportRouteDistance2TKFuelKoefControllerSoapPort;

  if(ENTransportRouteDistanceObj.code = Low(Integer)) then Exit;

  tsid2fkFilter := ENTransportRouteDistance2TKFuelKoefFilter.Create;
  SetNullIntProps(tsid2fkFilter);
  SetNullXSProps(tsid2fkFilter);
  tsid2fkFilter.TransportRouteDistanceRef := ENTransportRouteDistanceRef.Create;
  tsid2fkFilter.TransportRouteDistanceRef.code := ENTransportRouteDistanceObj.code;

  ENTransportRouteDistance2TKFuelKoefList := TempENTransportRouteDistance2TKFuelKoef.getScrollableFilteredList(tsid2fkFilter,0,-1);


  LastCount:=High(ENTransportRouteDistance2TKFuelKoefList.list);

  if LastCount > -1 then
     sgENTransportRouteDistance2TKFuelKoef.RowCount:=LastCount+2
  else
     sgENTransportRouteDistance2TKFuelKoef.RowCount:=2;

   with sgENTransportRouteDistance2TKFuelKoef do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTransportRouteDistance2TKFuelKoefList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENTransportRouteDistance2TKFuelKoefList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENTransportRouteDistance2TKFuelKoefList.list[i].tkFuelKoefRefName;
        if(ENTransportRouteDistance2TKFuelKoefList.list[i].tkFuelKoefRefKoef <> nil) then
          Cells[2,i+1] := ENTransportRouteDistance2TKFuelKoefList.list[i].tkFuelKoefRefKoef.DecimalString
        else
          Cells[2,i+1] := '';
        LastRow:=i+1;
        sgENTransportRouteDistance2TKFuelKoef.RowCount:=LastRow+1;
      end;
   sgENTransportRouteDistance2TKFuelKoef.Row:=1;
end;




procedure TfrmENTransportRouteDistanceEdit.actDeleteExecute(
  Sender: TObject);
var
  TempENTransportRouteDistance2TKFuelKoef : ENTransportRouteDistance2TKFuelKoefControllerSoapPort;
  TempENTransportRouteDistance : ENTransportRouteDistanceControllerSoapPort;
  objCode : Integer;
begin
  inherited;
  try
    ObjCode := StrToInt(sgENTransportRouteDistance2TKFuelKoef.Cells[0,sgENTransportRouteDistance2TKFuelKoef.Row]);
  except
  on EConvertError do Exit;
  end;
  TempENTransportRouteDistance2TKFuelKoef := HTTPRIOENTransportRouteDistance2TKFuelKoef as ENTransportRouteDistance2TKFuelKoefControllerSoapPort;
  TempENTransportRouteDistance2TKFuelKoef.remove(objCode);
  TempENTransportRouteDistance := HTTPRIOENTransportRouteDistance as ENTransportRouteDistanceControllerSoapPort;
  edtKoef.Text := TempENTransportRouteDistance.getAggregateSumOfKoefs(ENTransportRouteDistanceObj.code).DecimalString;
  updateKoefGrid();
end;


procedure TfrmENTransportRouteDistanceEdit.actUpdateExecute(
  Sender: TObject);
begin
  inherited;
  updateKoefGrid();
end;

procedure TfrmENTransportRouteDistanceEdit.pcEditENTransportRouteDistanceChange(
  Sender: TObject);
begin
  inherited;
    if pcEditENTransportRouteDistance.ActivePage = tsENTransportRouteDistance2TKFuelKoef then
  begin
     updateKoefGrid;
  end;
end;

end.