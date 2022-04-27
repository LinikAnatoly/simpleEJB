
unit EditENWorkOrderBytItem;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENWorkOrderBytItemController, AdvObj ;

type
  TfrmENWorkOrderBytItemEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;

  btnOk: TButton;
  btnCancel: TButton;
    pcMain: TPageControl;
    tsMain: TTabSheet;
    lblContractNumberServices: TLabel;
    lblAccountNumber: TLabel;
    lblName: TLabel;
    lblAddress: TLabel;
    lblInvNumber: TLabel;
    lblSerialNumber: TLabel;
    lblSeal: TLabel;
    lblPhone: TLabel;
    lblCommentGen: TLabel;
    lblFINWorker: TLabel;
    lblFinWorkerTabNumber: TLabel;
    lblFINWorkerName: TLabel;
    lblKartaRefNum: TLabel;
    lblKartaRefName: TLabel;
    lblCustomerName: TLabel;
    lblRecordPointName: TLabel;
    edtContractNumberServices: TEdit;
    edtAccountNumber: TEdit;
    edtInvNumber: TEdit;
    edtSerialNumber: TEdit;
    edtSeal: TEdit;
    edtPhone: TEdit;
    edtCommentGen: TMemo;
    edtFINWorkerName: TEdit;
    edtName: TEdit;
    edtAddress: TEdit;
    edtFinWorkerTabNumber: TEdit;
    edtKartaRefNum: TEdit;
    edtKartaRefName: TEdit;
    edtCustomerName: TEdit;
    edtRecordPointName: TEdit;
    HTTPRIOENWorkOrderBytItem: THTTPRIO;
    tsMarks: TTabSheet;
    sgMarks: TAdvStringGrid;
    HTTPRIOENWorkOrderBytItem2Mark: THTTPRIO;
    lblRouteByt: TLabel;
    lblRouteBytNumbergen: TLabel;
    edtRouteBytNumbergen: TEdit;
    lblRouteBytName: TLabel;
    edtRouteBytName: TEdit;
    gbSCCounter: TGroupBox;
    lblSCCounterInvNumber: TLabel;
    lblSCCounterName: TLabel;
    lblSCCounterCode: TLabel;
    edtSCCounterInvNumber: TEdit;
    edtSCCounterName: TEdit;
    edtSCCounterCode: TEdit;
    lblSCCounterBuildNumber: TLabel;
    edtSCCounterBuildNumber: TEdit;
    HTTPRIOSCCounter: THTTPRIO;
    lblEWFPackCode: TLabel;
    edtEWFPackCode: TEdit;
    HTTPRIOENChangePersonByt: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbFINWorkerFinWorkerClick(Sender : TObject);
    procedure FormCreate(Sender: TObject);
  
  private
    { Private declarations }
    procedure UpdateMarksList;
  public
    { Public declarations }
    workOrderBytType: Integer;
  end;

var
  frmENWorkOrderBytItemEdit: TfrmENWorkOrderBytItemEdit;
  ENWorkOrderBytItemObj: ENWorkOrderBytItem;

implementation

uses
  ShowFINWorker
  ,FINWorkerController
, ENConsts, TKTechCardController, DMReportsUnit,
  ENWorkOrderBytItem2MarkController, SCCounterController,
  ENChangePersonBytController, ENPlanWorkController;

{uses  
    EnergyproController, EnergyproController2, ENWorkOrderBytItemController  ;
}
{$R *.dfm}

var
  MarkHeaders: array [1..3] of String =
        ( 'Код'
          ,'Код'
          ,'Маркер'
        );

procedure TfrmENWorkOrderBytItemEdit.FormCreate(Sender: TObject);
begin
  inherited;
  workOrderBytType := LOW_INT;
end;

procedure TfrmENWorkOrderBytItemEdit.FormShow(Sender: TObject);
var
  techCardObj: TKTechCard;
  TempSCCounter: SCCounterControllerSoapPort;
  SCCounterObject: SCCounter;
  TempENChangePersonByt: ENChangePersonBytControllerSoapPort;
  changePersonBytList: ENChangePersonBytShortList;
  changePersonBytFilter: ENChangePersonBytFilter;
begin
  DisableControls([edtCode, edtSCCounterCode, edtSCCounterName,edtSCCounterBuildNumber, edtSCCounterInvNumber]);

  pcMain.ActivePage := tsMain;
  tsMarks.TabVisible := false;

  SetGridHeaders(MarkHeaders, sgMarks.ColumnHeaders);

  if (DialogState = dsInsert) {or (DialogState = dsEdit)} then
  begin
    DenyBlankValues([
      edtName
      ,edtAddress
     ]);
   end;

  if (DialogState = dsEdit) then
  begin
    {
    DisableControlChildren(Self);
    DisableControls([edtCustomerName, edtCommentGen, btnOk, btnCancel], false);
    }
    DisableControlChildren(tsMain);
    DisableControls([edtCustomerName, edtCommentGen], false);
  end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(ENWorkOrderBytItemObj.code);

    edtContractNumberServices.Text := ENWorkOrderBytItemObj.contractNumberServices;
    edtAccountNumber.Text := ENWorkOrderBytItemObj.accountNumber;
    edtName.Text := ENWorkOrderBytItemObj.name;
    edtCustomerName.Text := ENWorkOrderBytItemObj.customerName;
    edtRecordPointName.Text := ENWorkOrderBytItemObj.recordPointName;
    edtAddress.Text := ENWorkOrderBytItemObj.address;
    edtInvNumber.Text := ENWorkOrderBytItemObj.invNumber;
    edtSerialNumber.Text := ENWorkOrderBytItemObj.serialNumber;
    edtSeal.Text := ENWorkOrderBytItemObj.seal;
    edtPhone.Text := ENWorkOrderBytItemObj.phone;

    HideControls([lblRouteByt, lblRouteBytNumbergen, edtRouteBytNumbergen, lblRouteBytName, edtRouteBytName]);
    HideControls([lblEWFPackCode, edtEWFPackCode]);

    if ENWorkOrderBytItemObj.routeBytRef <> nil then
      if ENWorkOrderBytItemObj.routeBytRef.code <> LOW_INT then
      begin
        HideControls([lblRouteByt, lblRouteBytNumbergen, edtRouteBytNumbergen, lblRouteBytName, edtRouteBytName], false);
        edtRouteBytNumbergen.Text := ENWorkOrderBytItemObj.routeBytNumbergen;
        edtRouteBytName.Text := ENWorkOrderBytItemObj.routeBytName;
      end;

    // Покажем код пакета из EnergyWorkFlow для случая смены владельца на лицевом (для бытовых точек учета)
    if ENWorkOrderBytItemObj.planRef <> nil then
      if ENWorkOrderBytItemObj.planRef.code <> LOW_INT then
      begin
        TempENChangePersonByt := HTTPRIOENChangePersonByt as ENChangePersonBytControllerSoapPort;

        changePersonBytFilter := ENChangePersonBytFilter.Create;
        SetNullIntProps(changePersonBytFilter);
        SetNullXSProps(changePersonBytFilter);

        changePersonBytFilter.planRef := ENPlanWorkRef.Create;
        changePersonBytFilter.planRef.code := ENWorkOrderBytItemObj.planRef.code;

        changePersonBytList := TempENChangePersonByt.getScrollableFilteredList(changePersonBytFilter, 0, -1);

        if changePersonBytList.totalCount > 0 then
        begin
          HideControls([lblEWFPackCode, edtEWFPackCode], false);
          edtEWFPackCode.Text := IntToStr(changePersonBytList.list[0].packCode);
        end;
      end;

    MakeMultiline(edtCommentGen.Lines, ENWorkOrderBytItemObj.commentGen);

    if ENWorkOrderBytItemObj.finWorker <> nil then
    begin
      edtFINWorkerName.Text := ENWorkOrderBytItemObj.finWorker.name;
      edtFinWorkerTabNumber.Text := ENWorkOrderBytItemObj.finWorker.tabNumber;
    end;

    if ENWorkOrderBytItemObj.humenItemRef <> nil then
      if ENWorkOrderBytItemObj.humenItemRef.code <> LOW_INT then
      begin
        techCardObj := DMReports.getTKTechCardByHumenItemCode(ENWorkOrderBytItemObj.humenItemRef.code);
        if techCardObj <> nil then
        begin
          edtKartaRefNum.Text := techCardObj.techKartNumber;
          edtKartaRefName.Text := techCardObj.name;
        end;
      end;

    gbSCCounter.Visible := false;

    // Покажем счетчик
    if ENWorkOrderBytItemObj.scCounterRef <> nil then
      if ENWorkOrderBytItemObj.scCounterRef.code <> LOW_INT then
      begin
        gbSCCounter.Visible := true;

        TempSCCounter := HTTPRIOSCCounter as SCCounterControllerSoapPort;
        SCCounterObject := TempSCCounter.getObject(ENWorkOrderBytItemObj.scCounterRef.code);

        if SCCounterObject <> nil then
        begin
          edtSCCounterCode.Text := IntToStr(SCCounterObject.code);
          edtSCCounterName.Text := SCCounterObject.name;
          edtSCCounterBuildNumber.Text := SCCounterObject.buildNumber;
          edtSCCounterInvNumber.Text := SCCounterObject.invNumber;
        end;
      end;

    tsMarks.TabVisible := (workOrderBytType = ENWORKORDERBYTTYPE_RAID_BY_BILLING);

    if workOrderBytType = ENWORKORDERBYTTYPE_RAID_BY_BILLING then
      UpdateMarksList;
  end;
end;



procedure TfrmENWorkOrderBytItemEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENWorkOrderBytItem: ENWorkOrderBytItemControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
      ,edtCustomerName
      ,edtAddress
     ])  then
  begin
    Application.MessageBox(PChar('Пустые поля недопустимы !'), PChar('Внимание !'), MB_ICONWARNING + MB_OK);
    Action := caNone;
    Exit;
  end
  else
  begin
    TempENWorkOrderBytItem := HTTPRIOENWorkOrderBytItem as ENWorkOrderBytItemControllerSoapPort;
    {

     ENWorkOrderBytItemObj.contractNumberServices := edtContractNumberServices.Text;

     ENWorkOrderBytItemObj.accountNumber := edtAccountNumber.Text;

     ENWorkOrderBytItemObj.name := edtName.Text;

     ENWorkOrderBytItemObj.address := edtAddress.Text;

     ENWorkOrderBytItemObj.invNumber := edtInvNumber.Text;

     ENWorkOrderBytItemObj.serialNumber := edtSerialNumber.Text;

     ENWorkOrderBytItemObj.seal := edtSeal.Text;

     ENWorkOrderBytItemObj.phone := edtPhone.Text;
    }

    // Менять даем только ФИО заказчика и примечание
    ENWorkOrderBytItemObj.customerName := edtCustomerName.Text;
    ENWorkOrderBytItemObj.commentGen := edtCommentGen.Text;

    {
    if DialogState = dsInsert then
    begin
      ENWorkOrderBytItemObj.code:=low(Integer);
      TempENWorkOrderBytItem.add(ENWorkOrderBytItemObj);
    end
    else
    }
    if DialogState = dsEdit then
    begin
      TempENWorkOrderBytItem.save(ENWorkOrderBytItemObj);
    end;
  end;
end;


procedure TfrmENWorkOrderBytItemEdit.spbFINWorkerFinWorkerClick(Sender : TObject);
//var
//   frmFINWorkerShow: TfrmFINWorkerShow;
begin
{
   frmFINWorkerShow:=TfrmFINWorkerShow.Create(Application,fmNormal);
   try
      with frmFINWorkerShow do
        if ShowModal = mrOk then
        begin
            try
               if ENWorkOrderBytItemObj.finWorker = nil then ENWorkOrderBytItemObj.finWorker := FINWorker.Create();
               ENWorkOrderBytItemObj.finWorker.code := StrToInt(GetReturnValue(sgFINWorker,0));
               edtFINWorkerFinWorkerName.Text:=GetReturnValue(sgFINWorker,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmFINWorkerShow.Free;
   end;
}
end;



procedure TfrmENWorkOrderBytItemEdit.UpdateMarksList;
var
  TempENWorkOrderBytItem2Mark: ENWorkOrderBytItem2MarkControllerSoapPort;
  i, LastCount: Integer;
  marksList: ENWorkOrderBytItem2MarkShortList;
  marksFilter: ENWorkOrderBytItem2MarkFilter;
begin
  ClearGrid(sgMarks);

  if DialogState = dsInsert then Exit;
  if ENWorkOrderBytItemObj = nil then Exit;
  if ENWorkOrderBytItemObj.code = LOW_INT then Exit;

  TempENWorkOrderBytItem2Mark := HTTPRIOENWorkOrderBytItem2Mark as ENWorkOrderBytItem2MarkControllerSoapPort;

  marksFilter := ENWorkOrderBytItem2MarkFilter.Create;
  SetNullIntProps(marksFilter);
  SetNullXSProps(marksFilter);

  marksFilter.workOrderBytItemRef := ENWorkOrderBytItemRef.Create;
  marksFilter.workOrderBytItemRef.code := ENWorkOrderBytItemObj.code;

  marksList := TempENWorkOrderBytItem2Mark.getScrollableFilteredList(marksFilter, 0, -1);

  LastCount := High(marksList.list);

  if LastCount > -1 then
    sgMarks.RowCount := LastCount + 2
  else
    sgMarks.RowCount := 2;

  with sgMarks do
    for i := 0 to LastCount do
    begin
      Application.ProcessMessages;

      if marksList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(marksList.list[i].code)
      else
        Cells[0,i+1] := '';

      if marksList.list[i].markCode <> Low(Integer) then
        Cells[1,i+1] := IntToStr(marksList.list[i].markCode)
      else
        Cells[1,i+1] := '';

      Cells[2,i+1] := marksList.list[i].markName;

      sgMarks.RowCount := i + 2;
    end;

   sgMarks.Row := 1;
end;

end.