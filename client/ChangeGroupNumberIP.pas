unit ChangeGroupNumberIP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons , DialogFormUnit,ChildFormUnit, InvokeRegistry,
  Rio, SOAPHTTPClient;

type
  TfrmChangeGroupNumberIP = class(TDialogForm)
    gbInvestProgramGroups: TGroupBox;
    spbInvestProgramGroups: TSpeedButton;
    lblInvestItemNumber: TLabel;
    edtInvestProgramGroupsName: TEdit;
    edtInvestItemNumber: TEdit;
    btnOk: TButton;
    btnCancel: TButton;
    HTTPRIOENPlanWork: THTTPRIO;
    HTTPRIOENInvestProgramGroups: THTTPRIO;
    procedure spbInvestProgramGroupsClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    invgroupcode : Integer;
  public
    { Public declarations }
    enplanworkcode: Integer;
  end;

var
  frmChangeGroupNumberIP: TfrmChangeGroupNumberIP;

implementation

uses ShowENInvestProgramGroups, ENInvestProgramGroupsController,
  ENPlanWorkController, ENConsts;

{$R *.dfm}

procedure TfrmChangeGroupNumberIP.FormClose(Sender: TObject;
  var Action: TCloseAction);
var TempENPlanWork: ENPlanWorkControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  begin
    if invgroupcode = -1  then
    begin
      Application.MessageBox(PChar('Не обрано розділ ІнвестПрограми !'), PChar('Увага !'), MB_ICONWARNING);
      Action := caNone;
      edtInvestProgramGroupsName.SetFocus;
      Exit;
    end;

    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
    TempENPlanWork.updateInvestProgramData(enplanworkcode, invgroupcode, edtInvestItemNumber.Text);
  end;
end;

procedure TfrmChangeGroupNumberIP.FormCreate(Sender: TObject);
begin
  inherited;
  invgroupcode := -1;
  enplanworkcode := LOW_INT;
end;

procedure TfrmChangeGroupNumberIP.FormShow(Sender: TObject);
var
  TempENPlanWork: ENPlanWorkControllerSoapPort;
  TempENInvestProgramGroups: ENInvestProgramGroupsControllerSoapPort;
  plan: ENPlanWork;
  investProgramGroup: ENInvestProgramGroups;
begin
  DisableControls([edtInvestProgramGroupsName]);
  DenyBlankValues([edtInvestProgramGroupsName]);

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
  plan := TempENPlanWork.getObject(enplanworkcode);

  if plan <> nil then
    if plan.invgroupRef <> nil then
      if plan.invgroupRef.code <> LOW_INT then
      begin
        invgroupcode := plan.invgroupRef.code;

        TempENInvestProgramGroups := HTTPRIOENInvestProgramGroups as ENInvestProgramGroupsControllerSoapPort;
        investProgramGroup := TempENInvestProgramGroups.getObject(invgroupcode);

        if investProgramGroup <> nil then
          edtInvestProgramGroupsName.Text := investProgramGroup.name;

        edtInvestItemNumber.Text := plan.investItemNumber;
      end;
end;

procedure TfrmChangeGroupNumberIP.spbInvestProgramGroupsClick(Sender: TObject);
var
   frmENInvestProgramGroupsShow : TfrmENInvestProgramGroupsShow;
   f : ENInvestProgramGroupsFilter;
begin
   f := ENInvestProgramGroupsFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);

   frmENInvestProgramGroupsShow := TfrmENInvestProgramGroupsShow.Create(Application, fmNormal, f);

   try
      with frmENInvestProgramGroupsShow do begin
        if ShowModal = mrOk then
        begin
            try
               invgroupcode := StrToInt(GetReturnValue(sgENInvestProgramGroups,0));
               edtInvestProgramGroupsName.Text := GetReturnValue(sgENInvestProgramGroups,1);
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENInvestProgramGroupsShow.Free;
   end;

end;

end.
