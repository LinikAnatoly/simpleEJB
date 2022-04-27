
unit EditFINServicesObjectFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	  EnergyproController, EnergyproController2, ENServicesObjectController ;

type
    TfrmFINServicesObjectFilterEdit = class(TDialogForm)

    lblContractNumber : TLabel;
    edtContractNumber: TEdit;

    lblContractDate : TLabel;
    edtContractDateFrom: TDateTimePicker;
    lblName : TLabel;
    edtName: TEdit;

    lblPartnerCode : TLabel;
    edtPartnerCode: TEdit;

    lblFinDocCode : TLabel;
    edtFinDocCode: TEdit;

    lblFinDocID : TLabel;
    edtFinDocID: TEdit;

    lblCommentGen : TLabel;
    edtCommentGen: TEdit;
  

    HTTPRIOENServicesObject: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    Label5: TLabel;
    Label6: TLabel;
    edtContractDateTo: TDateTimePicker;
    spbRQOrgOrg: TSpeedButton;
    lblContrAgentType: TLabel;
    cbContrAgentType: TComboBox;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbRQOrgOrgClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    partnerCode : String;
    contrAgentType : Integer;
    { Public declarations }

end;

var
  frmFINServicesObjectFilterEdit: TfrmFINServicesObjectFilterEdit;
  ENServicesObjectFilterObj: ENServicesObjectFilter;

implementation

uses
    ShowENDepartment, ENDepartmentController, ShowENElement,
    ENElementController, ENServicesContractStatusController, ENServicesObjectStatusController,
    RQOrgController, ShowRQOrg, DMReportsUnit, ENConsts;

{uses  
    EnergyproController, EnergyproController2, ENServicesObjectController  ;
}
{$R *.dfm}



procedure TfrmFINServicesObjectFilterEdit.FormCreate(Sender: TObject);
begin
  inherited;
  partnerCode := '';
  contrAgentType := Low(Integer);
end;


procedure TfrmFINServicesObjectFilterEdit.FormShow(Sender: TObject);
begin
  SetIntStyle(edtFinDocID);
  DisableControls([edtName, cbContrAgentType]);
  DenyBlankValues([edtName, edtContractNumber]);

  cbContrAgentType.ItemIndex := contrAgentType;
end;


procedure TfrmFINServicesObjectFilterEdit.spbRQOrgOrgClick(Sender: TObject);
var
  frmRQOrgShow : TfrmRQOrgShow;
  TempRQOrg : RQOrgControllerSoapPort;
begin
  inherited;
  frmRQOrgShow := TfrmRQOrgShow.Create(Application,fmNormal);
  frmRQOrgShow.contrAgentType := cbContrAgentType.ItemIndex;
  try
    with frmRQOrgShow do
      if ShowModal = mrOk then
      begin
        try
          edtName.Text := GetReturnValue(sgRQOrg,1);
          if not DMReports.UsesMDAXData(CONFIG_USES_MDAX_CUSTOMER) then
            partnerCode := GetReturnValue(sgRQOrg, 8)
          else
            partnerCode := GetReturnValue(sgRQOrg, 25);
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmRQOrgShow.Free;
  end;
end;


procedure TfrmFINServicesObjectFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var
  TempENServicesObject: ENServicesObjectControllerSoapPort;
  condition: String;
begin
  if (ModalResult = mrOk)  then
  begin
    if (partnerCode = '') then
    begin
      Application.MessageBox(PChar('ќбер≥ть орган≥зац≥ю!!!'),PChar('”вага!!!'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
    end else
    begin
      condition := '';

      ENServicesObjectFilterObj.partnerCode := partnerCode;

      if (edtContractNumber.Text <> '') then
        ENServicesObjectFilterObj.contractNumber := edtContractNumber.Text;

       {
       if edtcontractDate.checked then
       begin
         if ENServicesObjectFilterObj.contractDate = nil then
            ENServicesObjectFilterObj.contractDate := TXSDate.Create;
         ENServicesObjectFilterObj.contractDate.XSToNative(GetXSDate(edtcontractDate.DateTime));
       end
       else
         ENServicesObjectFilterObj.contractDate := nil;
       }
       if edtContractDateFrom.Checked then
       begin
         AddCondition(condition, ' a.in_date >= to_date(''' + DateToStr(edtContractDateFrom.Date) + ''', ''dd.MM.yyyy'')');
       end;

       if edtContractDateTo.Checked then
       begin
         AddCondition(condition, ' a.in_date <= to_date(''' + DateToStr(edtContractDateTo.Date) + ''', ''dd.MM.yyyy'')');
       end;

       // ENServicesObjectFilterObj.name := edtName.Text;
       // ENServicesObjectFilterObj.partnerCode := edtPartnerCode.Text;
       // ENServicesObjectFilterObj.finDocCode := edtFinDocCode.Text;

       if ( edtFinDocID.Text <> '' ) then
         ENServicesObjectFilterObj.finDocID := StrToInt(edtFinDocID.Text)
       else
         ENServicesObjectFilterObj.finDocID := Low(Integer) ;

       // ENServicesObjectFilterObj.commentGen := edtCommentGen.Text;
       ENServicesObjectFilterObj.conditionSQL := condition;
    end;
  end;
end;

end.
