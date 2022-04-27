
unit EditRQBillFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQBillController ;

type
  TfrmRQBillFilterEdit = class(TDialogForm)

    lblNumberDoc : TLabel;
    edtNumberDoc: TEdit;
    lblNumberProject : TLabel;
    edtNumberProject: TEdit;
    lblDateGen : TLabel;
    edtDateGenStart: TDateTimePicker;
  edtRQOrgOrgName : TEdit;
  

  HTTPRIORQBill: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    lblRQOrgOrgName: TLabel;
    lblContractNumber: TLabel;
    edtContractNumber: TEdit;
    Label1: TLabel;
    edtDateGenFinal: TDateTimePicker;
    edtState: TComboBox;
    lblState: TLabel;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbRQOrgOrgClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmRQBillFilterEdit: TfrmRQBillFilterEdit;
  RQBillFilterObj: RQBillFilter;

implementation

uses
  ShowRQOrg
  ,RQOrgController
  ,ENConsts
;

{uses  
    EnergyproController, EnergyproController2, RQBillController  ;
}
{$R *.dfm}



procedure TfrmRQBillFilterEdit.FormShow(Sender: TObject);

begin

   edtDateGenStart.DateTime := now;
   edtDateGenStart.Checked := false;

   edtDateGenFinal.DateTime := now;
   edtDateGenFinal.Checked := false;

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtNumberDoc
      ,edtDateGen
      ,edtDateEdit
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtNumberDoc.Text := RQBillObj.numberDoc; 



    edtNumberProject.Text := RQBillObj.numberProject; 



      if RQBillObj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(RQBillObj.dateGen.Year,RQBillObj.dateGen.Month,RQBillObj.dateGen.Day);
        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;



    edtCommentGen.Text := RQBillObj.commentGen; 



    edtUserGen.Text := RQBillObj.userGen; 



      if RQBillObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(RQBillObj.dateEdit.Year,RQBillObj.dateEdit.Month,RQBillObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;


  end;

}

end;



procedure TfrmRQBillFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQBill: RQBillControllerSoapPort;
    condition : String;
begin
  if (ModalResult = mrOk)  then
  begin

     RQBillFilterObj.numberDoc := edtNumberDoc.Text;
     RQBillFilterObj.numberProject := edtNumberProject.Text;
     RQBillFilterObj.contractNumber := edtContractNumber.Text;

     if (edtRQOrgOrgName.Text <> '') then
      begin
        RQBillFilterObj.org := RQOrg.Create;
        RQBillFilterObj.org.code := LOW_INT;
        RQBillFilterObj.org.name := edtRQOrgOrgName.Text;
      end;



     condition := '';

     if edtdateGenStart.checked then
     begin
       //if RQBillFilterObj.dateGen = nil then
       //RQBillFilterObj.dateGen := TXSDate.Create;
       //RQBillFilterObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
       AddCondition(condition, ' rqbill.dategen >= to_date(''' + DateToStr(edtDateGenStart.Date) + ''', ''dd.MM.yyyy'')');
     end;
     //else
     //  RQBillFilterObj.dateGen := nil;

     if edtdateGenFinal.checked then
     begin
       //if RQBillFilterObj.dateGen = nil then
       //RQBillFilterObj.dateGen := TXSDate.Create;
       //RQBillFilterObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
       AddCondition(condition, ' rqbill.dategen <= to_date(''' + DateToStr(edtDateGenFinal.Date) + ''', ''dd.MM.yyyy'')');
     end;

     if edtState.ItemIndex <> -1 then
        begin
        AddCondition(condition, ' rqbill.code in (select distinct(rqbill.code)' +
                                   ' from rqbill, rqbillitem' +
                                   ' where rqbill.code = rqbillitem.billrefcode' +
                                   ' and rqbillitem.staterefcode = ');
          case edtState.ItemIndex of
               0 : condition := condition + '0';
               1 : condition := condition + '1';
          end;

       condition := condition + ')';

        end;

     RQBillFilterObj.conditionSQL := condition;

     //RQBillFilterObj.commentGen := edtCommentGen.Text;
     //RQBillFilterObj.userGen := edtUserGen.Text;

  end;
end;


procedure TfrmRQBillFilterEdit.spbRQOrgOrgClick(Sender : TObject);
var
   frmRQOrgShow: TfrmRQOrgShow;
begin
   frmRQOrgShow := TfrmRQOrgShow.Create(Application,fmNormal);
   frmRQOrgShow.contrAgentType := AX_CONTRAGENT_TYPE_VENDOR;
   try
      with frmRQOrgShow do
        if ShowModal = mrOk then
        begin
            try
               if RQBillFilterObj.org = nil then RQBillFilterObj.org := RQOrg.Create();
               RQBillFilterObj.org.code := StrToInt(GetReturnValue(sgRQOrg,0));
               edtRQOrgOrgName.Text:=GetReturnValue(sgRQOrg,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmRQOrgShow.Free;
   end;
end;





end.
