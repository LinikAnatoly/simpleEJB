
unit EditENAutoTires;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	  EnergyproController, EnergyproController2, ENAutoTiresController;

type
  TfrmENAutoTiresEdit = class(TDialogForm)
  
  lblCode : TLabel;
	edtCode : TEdit;
  
  HTTPRIOENAutoTires: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    pcAutoTires: TPageControl;
    tsAutoTires: TTabSheet;
    lblTypeName: TLabel;
    edtTypeName: TEdit;
    edtGarageNumber: TEdit;
    lblGarageNumber: TLabel;
    lblSerialNumber: TLabel;
    edtSerialNumber: TEdit;
    lblFactory: TLabel;
    edtFactory: TEdit;
    lblNominal: TLabel;
    edtNominal: TEdit;
    lblFinMolCode: TLabel;
    edtMaterialsName: TEdit;
    spbTkMaterials: TSpeedButton;
    tsTiresHistory: TTabSheet;
    lblIsInstalled: TLabel;
    edtIsInstalled: TEdit;
    HTTPRIOSpr_matherial: THTTPRIO;
    sgENAutoTiresHistory: TAdvStringGrid;
    HTTPRIOENAutoTiresHistory: THTTPRIO;
    lblPotencial: TLabel;
    edtPotencial: TEdit;
    lblDistanceAll: TLabel;
    edtDistanceAll: TEdit;
    tsTiresDistance: TTabSheet;
    sgTiresDistance: TAdvStringGrid;
    gbTKTransportReal: TGroupBox;
    lblGosNumber: TLabel;
    edtGosNumber: TEdit;
    lblInvNumber: TLabel;
    edtInvNumber: TEdit;
    lblTKTransportMarkTransportmarkName: TLabel;
    edtTKTransportMarkTransportmarkName: TEdit;
    lblInstallPlaces: TLabel;
    edtInstallPlaces: TEdit;
    btnPrintBlank: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  procedure spbTkMaterialsClick(Sender: TObject);
  procedure pcAutoTiresChange(Sender: TObject);
  procedure btnPrintBlankClick(Sender: TObject);
  
  
  private
    { Private declarations }
  public
    { Public declarations }
    ENAutoTiresObj: ENAutoTires;

end;

var
  frmENAutoTiresEdit: TfrmENAutoTiresEdit;
  //ENAutoTiresObj: ENAutoTires;


implementation


uses ENTiresInstallStatusController, ShowTKMaterials,
     ENAutoTiresHistoryController, TKMaterialsController, DMReportsUnit;

{uses
    EnergyproController, EnergyproController2, ENAutoTiresController  ;
}
{$R *.dfm}


var ColCount, LastCount: Integer;
    LastRow: Integer = 1;

    ENAutoTiresHistoryHeaders: array [1..5] of String =
          ( 'Код'
            ,'дата монтажа'
            ,'дата демонтажа'
            ,'пробег'
            ,'причина выхода из эксплуатации'
          );


procedure TfrmENAutoTiresEdit.FormShow(Sender: TObject);
var TempSpr_matherial: TKMaterialsControllerSoapPort;
    Spr_matherialObj: TKMaterials;
    Spr_matherialFilterObj: TKMaterialsFilter;
    Spr_matherialList : TKMaterialsShortList;
    TempENAutoTires: ENAutoTiresControllerSoapPort;
    info : ENAutoTiresInstallInfo;    
begin

  pcAutoTires.ActivePage := tsAutoTires;
  SetFloatStyle([edtPotencial, edtDistanceAll]);
  DisableControls([edtCode, edtIsInstalled, edtInvNumber, edtGosNumber,
    edtTKTransportMarkTransportmarkName, edtInstallPlaces]);

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([edtTypeName, edtGarageNumber, edtSerialNumber, edtFactory,
      edtNominal, edtMaterialsName, edtPotencial, edtDistanceAll]);
   end;

  if (DialogState = dsInsert) then
    begin
      tsTiresDistance.TabVisible := False;
      tsTiresHistory.TabVisible := False;
      gbTKTransportReal.Visible := False;
    end;

  if  (DialogState = dsEdit) then
    begin
       DisableControls([edtDistanceAll]);
    end;


  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENAutoTiresObj.code);
    edtTypeName.Text := ENAutoTiresObj.typeName;
    edtGarageNumber.Text := ENAutoTiresObj.garageNumber; 
    edtSerialNumber.Text := ENAutoTiresObj.serialNumber; 
    edtFactory.Text := ENAutoTiresObj.factory; 

    if ( ENAutoTiresObj.potencial <> nil ) then
       edtPotencial.Text := ENAutoTiresObj.potencial.decimalString
    else
       edtPotencial.Text := '';
    if ( ENAutoTiresObj.distanceAll <> nil ) then
       edtDistanceAll.Text := ENAutoTiresObj.distanceAll.decimalString
    else
       edtDistanceAll.Text := '';
    edtNominal.Text := ENAutoTiresObj.nominal;


    case ENAutoTiresObj.installStatusRef.code of
    0:
      begin
        edtIsInstalled.Text := 'нет';
      end;
    1:
      begin
        edtIsInstalled.Text := 'да';
      end;
    end;

    if (ENAutoTiresObj.installStatusRef.code = 1) then
    begin
      TempENAutoTires := HTTPRIOENAutoTires as ENAutoTiresControllerSoapPort;
      info := ENAutoTiresInstallInfo.Create;
      info := TempENAutoTires.getInstallInfo(ENAutoTiresObj.code);

      edtInvNumber.Text := info.invNumber;
      edtGosNumber.Text := info.gosNumber;
      edtTKTransportMarkTransportmarkName.Text := info.transportMark;
      edtInstallPlaces.Text := info.installPlaces;
    end else
    begin
      edtInvNumber.Text := '';
      edtGosNumber.Text := '';
      edtTKTransportMarkTransportmarkName.Text := '';
      edtInstallPlaces.Text := '';
    end;

    if ENAutoTiresObj.materialRef <> nil then
      if ENAutoTiresObj.materialRef.code <> Low(Integer) then
      begin
        TempSpr_matherial := HTTPRIOSpr_matherial as TKMaterialsControllerSoapPort;
        Spr_matherialFilterObj := TKMaterialsFilter.Create;
        SetNullIntProps(Spr_matherialFilterObj);
        Spr_matherialFilterObj.code := ENAutoTiresObj.materialRef.code;
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

  end;
end;



procedure TfrmENAutoTiresEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENAutoTires: ENAutoTiresControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([edtTypeName, edtGarageNumber, edtSerialNumber, edtFactory,
      edtNominal, edtMaterialsName, edtPotencial, edtDistanceAll]) then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENAutoTires := HTTPRIOENAutoTires as ENAutoTiresControllerSoapPort;

     if DialogState = dsInsert then
      begin
        ENAutoTiresObj.installStatusRef := ENTiresInstallStatusRef.Create;
        ENAutoTiresObj.installStatusRef.code := 0;
      end;

     ENAutoTiresObj.typeName := edtTypeName.Text;

     ENAutoTiresObj.garageNumber := edtGarageNumber.Text; 

     ENAutoTiresObj.serialNumber := edtSerialNumber.Text; 

     ENAutoTiresObj.factory := edtFactory.Text; 

     if (ENAutoTiresObj.potencial = nil ) then
       ENAutoTiresObj.potencial := TXSDecimal.Create;
     if edtPotencial.Text <> '' then
       ENAutoTiresObj.potencial.decimalString := edtPotencial.Text 
     else
       ENAutoTiresObj.potencial := nil;

     if (ENAutoTiresObj.distanceAll = nil ) then
       ENAutoTiresObj.distanceAll := TXSDecimal.Create;
     if edtDistanceAll.Text <> '' then
       ENAutoTiresObj.distanceAll.decimalString := edtDistanceAll.Text 
     else
       ENAutoTiresObj.distanceAll := nil;
     
     ENAutoTiresObj.nominal := edtNominal.Text;

     if DialogState = dsInsert then
     begin
       ENAutoTiresObj.code:=low(Integer);
       TempENAutoTires.add(ENAutoTiresObj);
     end
     else
     if DialogState = dsEdit then
     begin
       TempENAutoTires.save(ENAutoTiresObj);
     end;
  end;
end;


procedure TfrmENAutoTiresEdit.spbTkMaterialsClick(Sender: TObject);
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
          if ENAutoTiresObj.materialRef = nil then ENAutoTiresObj.materialRef := TKMaterialsRef.Create;
          ENAutoTiresObj.materialRef.code := TKMaterialsShort(tvDep.Selected.Data).code;
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


procedure TfrmENAutoTiresEdit.pcAutoTiresChange(Sender: TObject);
var TempENAutoTiresHistory: ENAutoTiresHistoryControllerSoapPort;
    i: Integer;
    ENAutoTiresHistoryList: ENAutoTiresHistoryShortList;
    thFilter : ENAutoTiresHistoryFilter;
begin
   if pcAutoTires.ActivePage = tsTiresHistory then
     begin
        SetGridHeaders(ENAutoTiresHistoryHeaders, sgENAutoTiresHistory.ColumnHeaders);
        TempENAutoTiresHistory :=  HTTPRIOENAutoTiresHistory as ENAutoTiresHistoryControllerSoapPort;

        thFilter := ENAutoTiresHistoryFilter.Create;
        SetNullIntProps(thFilter);
        SetNullXSProps(thFilter);
        thFilter.tiresRef := ENAutoTiresRef.Create;
        thFilter.tiresRef.code := ENAutoTiresObj.code;

        ENAutoTiresHistoryList := TempENAutoTiresHistory.getScrollableFilteredList(ENAutoTiresHistoryFilter(thFilter),0,ColCount);
        LastCount:=High(ENAutoTiresHistoryList.list);

        if LastCount > -1 then
           sgENAutoTiresHistory.RowCount:=LastCount+2
        else
           sgENAutoTiresHistory.RowCount:=2;

         with sgENAutoTiresHistory do
          for i:=0 to LastCount do
            begin
              Application.ProcessMessages;
              if ENAutoTiresHistoryList.list[i].code <> Low(Integer) then
              Cells[0,i+1] := IntToStr(ENAutoTiresHistoryList.list[i].code)
              else
              Cells[0,i+1] := '';
              if ENAutoTiresHistoryList.list[i].installDate = nil then
                Cells[1,i+1] := ''
              else
                Cells[1,i+1] := XSDate2String(ENAutoTiresHistoryList.list[i].installDate);
              if ENAutoTiresHistoryList.list[i].uninstallDate = nil then
                Cells[2,i+1] := ''
              else
                Cells[2,i+1] := XSDate2String(ENAutoTiresHistoryList.list[i].uninstallDate);
              if ENAutoTiresHistoryList.list[i].distance = nil then
                Cells[3,i+1] := ''
              else
                Cells[3,i+1] := ENAutoTiresHistoryList.list[i].distance.DecimalString;
              Cells[4,i+1] := ENAutoTiresHistoryList.list[i].replacementReason;
              LastRow:=i+1;
              sgENAutoTiresHistory.RowCount:=LastRow+1;
            end;

       ColCount:=ColCount+1;
       sgENAutoTiresHistory.Row:=1;
     end;
end;


procedure TfrmENAutoTiresEdit.btnPrintBlankClick(Sender: TObject);
var
  argNames, args : ArrayOfString;
  reportName : String;
begin
      SetLength(argNames, 1);
      SetLength(args, 1);

      argNames[0] := 'tiresCode';
      args[0] := IntToStr(ENAutoTiresObj.code);

      reportName := 'AutoTires/AutoTiresBlank';
      makeReport(reportName, argNames, args, 'pdf');
end;


end.