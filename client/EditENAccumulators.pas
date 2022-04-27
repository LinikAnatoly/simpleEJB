
unit EditENAccumulators;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
  	EnergyproController, EnergyproController2, ENAccumulatorsController;

type
  TfrmENAccumulatorsEdit = class(TDialogForm)

  lblCode : TLabel;
	edtCode : TEdit;
  HTTPRIOENAccumulators: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    pcAccumulators: TPageControl;
    tsAccumulators: TTabSheet;
    tsAccumulatorsHistory: TTabSheet;
    lblName: TLabel;
    lblTypeName: TLabel;
    lblFactory: TLabel;
    lblGarageNumber: TLabel;
    lblYearProduction: TLabel;
    lblSerialNumber: TLabel;
    lblMileage: TLabel;
    lblReceiptDate: TLabel;
    edtName: TEdit;
    edtTypeName: TEdit;
    edtFactory: TEdit;
    edtGarageNumber: TEdit;
    edtYearProduction: TEdit;
    edtSerialNumber: TEdit;
    edtReceiptDate: TDateTimePicker;
    edtMileage: TEdit;
    sgENAccumulatorsHistory: TAdvStringGrid;
    HTTPRIOENAccumulatorsHistory: THTTPRIO;
    lblPotencial: TLabel;
    edtPotencial: TEdit;
    edtMileageAll: TEdit;
    lblFinMolCode: TLabel;
    edtMaterialsName: TEdit;
    spbTkMaterials: TSpeedButton;
    lblIsInstalled: TLabel;
    edtIsInstalled: TEdit;
    tsAccumulatorDistance: TTabSheet;
    sgAccumulatorDistance: TAdvStringGrid;
    HTTPRIOSpr_matherial: THTTPRIO;
    lblMileageAll: TLabel;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pcAccumulatorsChange(Sender: TObject);
    procedure spbTkMaterialsClick(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
    ENAccumulatorsObj: ENAccumulators;

end;

var
  frmENAccumulatorsEdit: TfrmENAccumulatorsEdit;
  //ENAccumulatorsObj: ENAccumulators;


implementation

{$R *.dfm}

uses ENAccumulatorsHistoryController, ENAccumulatorStatusController,
     ShowTKMaterials, TKMaterialsController;

var ColCount, LastCount: Integer;
    LastRow: Integer = 1;

    ENAccumulatorsHistoryHeaders: array [1..5] of String =
          ( 'Код'
            ,'дата установки'
            ,'дата снятия'
            ,'пройдено'            
            ,'причина выхода из эксплуатации'
          );

          
procedure TfrmENAccumulatorsEdit.FormShow(Sender: TObject);
var TempSpr_matherial: TKMaterialsControllerSoapPort;
    Spr_matherialObj: TKMaterials;
    Spr_matherialFilterObj: TKMaterialsFilter;
    Spr_matherialList : TKMaterialsShortList;
begin

  SetFloatStyle([edtYearProduction, edtMileage, edtPotencial, edtMileageAll]);
  pcAccumulators.ActivePage := tsAccumulators;
  DisableControls([edtCode, edtIsInstalled]);

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([edtName, edtTypeName, {edtGarageNumber,} edtYearProduction, edtReceiptDate,
      edtSerialNumber, edtFactory, edtMileage, edtPotencial, edtMileageAll, edtMaterialsName]);
  end;

  if (DialogState = dsInsert) then
  begin
     tsAccumulatorDistance.TabVisible := False;
     tsAccumulatorsHistory.TabVisible := False;
     edtMileage.Text := '0';  
  end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENAccumulatorsObj.code);
      edtName.Text := ENAccumulatorsObj.name;
      edtTypeName.Text := ENAccumulatorsObj.typeName;
      edtFactory.Text := ENAccumulatorsObj.factory;
      edtGarageNumber.Text := ENAccumulatorsObj.garageNumber;
      edtYearProduction.Text := ENAccumulatorsObj.yearProduction;
      edtSerialNumber.Text := ENAccumulatorsObj.serialNumber;

      if ENAccumulatorsObj.receiptDate <> nil then
      begin
        edtReceiptDate.DateTime:=EncodeDate(ENAccumulatorsObj.receiptDate.Year,ENAccumulatorsObj.receiptDate.Month,ENAccumulatorsObj.receiptDate.Day);
        edtReceiptDate.checked := true;
      end
      else
      begin
        edtReceiptDate.DateTime:=SysUtils.Date;
        edtReceiptDate.checked := false;
      end;

      case ENAccumulatorsObj.installStatusRef.code of
        0:
          begin
            edtIsInstalled.Text := 'нет';
          end;
        1:
          begin
            edtIsInstalled.Text := 'да';
          end;
      end;

      if ENAccumulatorsObj.materialRef <> nil then
        if ENAccumulatorsObj.materialRef.code <> Low(Integer) then
        begin
          TempSpr_matherial := HTTPRIOSpr_matherial as TKMaterialsControllerSoapPort;
          Spr_matherialFilterObj := TKMaterialsFilter.Create;
          SetNullIntProps(Spr_matherialFilterObj);
          Spr_matherialFilterObj.code := ENAccumulatorsObj.materialRef.code;
          Spr_matherialList := TempSpr_matherial.getScrollableFilteredList(Spr_matherialFilterObj, 0, -1);
          if (Spr_matherialList.totalCount > 0) then
          begin
             edtMaterialsName.Text := Spr_matherialList.list[0].name;
          end
          else
          begin
             edtMaterialsName.Text := '';
          end;

        end;

      if ( ENAccumulatorsObj.mileage <> nil ) then
         edtMileage.Text := ENAccumulatorsObj.mileage.decimalString
      else
         edtMileage.Text := ''; 
      if ( ENAccumulatorsObj.mileageAll <> nil ) then
         edtMileageAll.Text := ENAccumulatorsObj.mileageAll.decimalString
      else
         edtMileageAll.Text := '';
      if ( ENAccumulatorsObj.potencial <> nil ) then
         edtPotencial.Text := ENAccumulatorsObj.potencial.decimalString
      else
         edtPotencial.Text := '';

  end;
end;



procedure TfrmENAccumulatorsEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENAccumulators: ENAccumulatorsControllerSoapPort;
begin

  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([edtName, edtTypeName, {edtGarageNumber,} edtYearProduction, edtReceiptDate,
      edtSerialNumber, edtFactory, edtMileage, edtPotencial, edtMileageAll, edtMaterialsName]) then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENAccumulators := HTTPRIOENAccumulators as ENAccumulatorsControllerSoapPort;

     if DialogState = dsInsert then
      begin
        ENAccumulatorsObj.installStatusRef := ENAccumulatorStatusRef.Create;
        ENAccumulatorsObj.installStatusRef.code := 0;
      end;

     ENAccumulatorsObj.name := edtName.Text;
     ENAccumulatorsObj.typeName := edtTypeName.Text;
     ENAccumulatorsObj.factory := edtFactory.Text;
     ENAccumulatorsObj.garageNumber := edtGarageNumber.Text;
     ENAccumulatorsObj.yearProduction := edtYearProduction.Text;
     ENAccumulatorsObj.serialNumber := edtSerialNumber.Text;

     if edtreceiptDate.checked then
     begin 
       if ENAccumulatorsObj.receiptDate = nil then
          ENAccumulatorsObj.receiptDate := TXSDate.Create;
       ENAccumulatorsObj.receiptDate.XSToNative(GetXSDate(edtreceiptDate.DateTime));
     end
     else
       ENAccumulatorsObj.receiptDate := nil;

     if (ENAccumulatorsObj.mileage = nil ) then
       ENAccumulatorsObj.mileage := TXSDecimal.Create;
     if edtMileage.Text <> '' then
       ENAccumulatorsObj.mileage.decimalString := edtMileage.Text 
     else
       ENAccumulatorsObj.mileage := nil;

     if (ENAccumulatorsObj.mileageAll = nil ) then
       ENAccumulatorsObj.mileageAll := TXSDecimal.Create;
     if edtMileageAll.Text <> '' then
       ENAccumulatorsObj.mileageAll.decimalString := edtMileageAll.Text
     else
       ENAccumulatorsObj.mileageAll := nil;

     if (ENAccumulatorsObj.potencial = nil ) then
       ENAccumulatorsObj.potencial := TXSDecimal.Create;
     if edtPotencial.Text <> '' then
       ENAccumulatorsObj.potencial.decimalString := edtPotencial.Text
     else
       ENAccumulatorsObj.potencial := nil;

     if DialogState = dsInsert then
     begin
       ENAccumulatorsObj.code:=low(Integer);
       TempENAccumulators.add(ENAccumulatorsObj);
     end
     else
     if DialogState = dsEdit then
     begin
       TempENAccumulators.save(ENAccumulatorsObj);
     end;
  end;
end;


procedure TfrmENAccumulatorsEdit.pcAccumulatorsChange(Sender: TObject);
var
  TempENAccumulatorsHistory: ENAccumulatorsHistoryControllerSoapPort;
  i: Integer;
  ENAccumulatorsHistoryList: ENAccumulatorsHistoryShortList;
  ahFilter : ENAccumulatorsHistoryFilter;
begin
   if pcAccumulators.ActivePage = tsAccumulatorsHistory then
   begin
      SetGridHeaders(ENAccumulatorsHistoryHeaders, sgENAccumulatorsHistory.ColumnHeaders);
      TempENAccumulatorsHistory :=  HTTPRIOENAccumulatorsHistory as ENAccumulatorsHistoryControllerSoapPort;

      ahFilter := ENAccumulatorsHistoryFilter.Create;
      SetNullIntProps(ahFilter);
      SetNullXSProps(ahFilter);
      ahFilter.accumulatorsRef := ENAccumulatorsRef.Create;
      ahFilter.accumulatorsRef.code := ENAccumulatorsObj.code;

      ENAccumulatorsHistoryList := TempENAccumulatorsHistory.getScrollableFilteredList(ENAccumulatorsHistoryFilter(ahFilter),0,ColCount);
      LastCount:=High(ENAccumulatorsHistoryList.list);

      if LastCount > -1 then
         sgENAccumulatorsHistory.RowCount:=LastCount+2
      else
         sgENAccumulatorsHistory.RowCount:=2;

       with sgENAccumulatorsHistory do
        for i:=0 to LastCount do
          begin
            Application.ProcessMessages;
            if ENAccumulatorsHistoryList.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(ENAccumulatorsHistoryList.list[i].code)
            else
            Cells[0,i+1] := '';
            if ENAccumulatorsHistoryList.list[i].installDate = nil then
              Cells[1,i+1] := ''
            else
              Cells[1,i+1] := XSDate2String(ENAccumulatorsHistoryList.list[i].installDate);
            if ENAccumulatorsHistoryList.list[i].uninstallDate = nil then
              Cells[2,i+1] := ''
            else
              Cells[2,i+1] := XSDate2String(ENAccumulatorsHistoryList.list[i].uninstallDate);
            if ENAccumulatorsHistoryList.list[i].distance = nil then
              Cells[3,i+1] := ''
            else
              Cells[3,i+1] := ENAccumulatorsHistoryList.list[i].distance.DecimalString;
            Cells[4,i+1] := ENAccumulatorsHistoryList.list[i].replacementReason;
            LastRow:=i+1;
            sgENAccumulatorsHistory.RowCount:=LastRow+1;
          end;
       ColCount:=ColCount+1;
       sgENAccumulatorsHistory.Row:=1;
   end;
end;

procedure TfrmENAccumulatorsEdit.spbTkMaterialsClick(Sender: TObject);
var frmSpr_matherialShow: TfrmTKMaterialsShow;
    mtFilter : TKMaterialsFilter;
begin
  if DialogState = dsView then Exit;

  frmSpr_matherialShow := TfrmTKMaterialsShow.Create(Application, fmNormal);

  try
    with frmSpr_matherialShow do
    begin
      DisableActions([actInsert, actEdit, actDelete]);
      DenyGroupSelection := true;
      
      if ShowModal = mrOk then
      begin
        try
          if ENAccumulatorsObj.materialRef = nil then ENAccumulatorsObj.materialRef := TKMaterialsRef.Create;
          ENAccumulatorsObj.materialRef.code := TKMaterialsShort(tvDep.Selected.Data).code;
          edtMaterialsName.Text := TKMaterialsShort(tvDep.Selected.Data).name;
        except
          on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmSpr_matherialShow.Free;
  end;
end;

end.
