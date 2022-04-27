
unit EditRQPayDocFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQPayDocController;

type
  TfrmRQPayDocFilterEdit = class(TDialogForm)

    lblSummaGen : TLabel;
    edtSummaGen: TEdit;

    lblCommentGen : TLabel;
    edtCommentGen: TEdit;

    lblNumberGen : TLabel;
    edtNumberGen: TEdit;

    lblDateGen : TLabel;
    edtDateGenStart: TDateTimePicker;
    lblPayOrder : TLabel;
    edtPayOrder: TEdit;



  HTTPRIORQPayDoc: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    Label1: TLabel;
    edtDateGenFinal: TDateTimePicker;
    lblPaymentMethod: TLabel;
    cmbPaymentMethod: TComboBox;
    gbAccountablePerson: TGroupBox;
    lblAccountablePerson: TLabel;
    edtAccountablePersonName: TEdit;
    spbAccountablePerson: TSpeedButton;
    edtAccountablePerson: TEdit;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbAccountablePersonClick(Sender: TObject);
  

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmRQPayDocFilterEdit: TfrmRQPayDocFilterEdit;
  RQPayDocFilterObj: RQPayDocFilter;

implementation


uses FINWorkerController, ShowFINWorker, RQPaymentMethodController
, User2StaffingController, DMReportsUnit;

{$R *.dfm}



procedure TfrmRQPayDocFilterEdit.FormShow(Sender: TObject);

begin

   edtDateGenStart.DateTime := now;
   edtDateGenStart.Checked := false;

   edtDateGenFinal.DateTime := now;
   edtDateGenFinal.Checked := false;

   DisableControls([edtAccountablePerson, edtAccountablePersonName]);
end;



procedure TfrmRQPayDocFilterEdit.spbAccountablePersonClick(Sender: TObject);
var
  user2StaffingObj : User2Staffing;
  selectedObj: FINWorkerShort;
begin
  inherited;
  user2StaffingObj := DMReports.getUser2StaffingOfCurrentUser;
  if (Assigned(user2StaffingObj)) and (Length(Trim(user2StaffingObj.podrCod)) > 0) then begin
    selectedObj := TfrmFINWorkerShow.chooseFromList(nil, user2StaffingObj.podrCod);
  end else begin
    selectedObj := TfrmFINWorkerShow.chooseFromList(nil);
  end;
  if Assigned(selectedObj) then begin
    edtAccountablePerson.Text := selectedObj.tabNumber;
    edtAccountablePersonName.Text := selectedObj.name;
  end;
end;

procedure TfrmRQPayDocFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQPayDoc: RQPayDocControllerSoapPort;
  condition : String;
begin
  if (ModalResult = mrOk)  then
  begin
     if (RQPayDocFilterObj.summaGen = nil ) then
       RQPayDocFilterObj.summaGen := TXSDecimal.Create;
     if edtSummaGen.Text <> '' then
       RQPayDocFilterObj.summaGen.decimalString := edtSummaGen.Text 
     else
       RQPayDocFilterObj.summaGen := nil;
       RQPayDocFilterObj.commentGen := edtCommentGen.Text;
       RQPayDocFilterObj.numberGen := edtNumberGen.Text;

     if cmbPaymentMethod.ItemIndex >= 0 then begin
        if RQPayDocFilterObj.paymentMethodRef = nil then
          RQPayDocFilterObj.paymentMethodRef := RQPaymentMethodRef.Create;
        RQPayDocFilterObj.paymentMethodRef.code := cmbPaymentMethod.ItemIndex + 1;
      end;



       {
     if edtdateGen.checked then
     begin
       if RQPayDocFilterObj.dateGen = nil then
          RQPayDocFilterObj.dateGen := TXSDate.Create;
          RQPayDocFilterObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end
     else
       RQPayDocFilterObj.dateGen := nil;
       RQPayDocFilterObj.payOrder := edtPayOrder.Text;
    end;
    }

     if edtdateGenStart.checked then
     begin
       AddCondition(condition, ' rqpaydoc.dategen >= to_date(''' + DateToStr(edtDateGenStart.Date) + ''', ''dd.MM.yyyy'')');
     end;

     if edtdateGenFinal.checked then
     begin
       AddCondition(condition, ' rqpaydoc.dategen <= to_date(''' + DateToStr(edtDateGenFinal.Date) + ''', ''dd.MM.yyyy'')');
     end;

     if Length(Trim(edtAccountablePerson.Text)) > 0 then begin
      AddCondition(condition, ' FINWORKER.TABNUMBER = ''' + edtAccountablePerson.Text + '''');
     end;

     RQPayDocFilterObj.conditionSQL := condition;
end;
end;



end.