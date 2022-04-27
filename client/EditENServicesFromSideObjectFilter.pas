
unit EditENServicesFromSideObjectFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENServicesFromSideObjectController ;

type
  TfrmENServicesFromSideObjectFilterEdit = class(TDialogForm)

    lblContractNumber : TLabel;
    edtContractNumber: TEdit;

    lblContractDate : TLabel;
    edtContractDate: TDateTimePicker;
    edtName: TEdit;

    lblPartnerCode : TLabel;
    edtPartnerCode: TEdit;

    lblFinDocCode : TLabel;
    edtFinDocCode: TEdit;

    lblFinDocID : TLabel;
    edtFinDocID: TEdit;

    lblCommentGen : TLabel;
    edtCommentGen: TMemo;

    lblUserGen : TLabel;
    edtUserGen: TEdit;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;

  lblENDepartmentDepartmentName : TLabel;
  edtENDepartmentDepartmentName : TEdit;
  spbENDepartmentDepartment : TSpeedButton;
  
  lblENElementElementName : TLabel;
  edtENElementElementName : TEdit;
  spbENElementElement : TSpeedButton;
  

  HTTPRIOENServicesFromSideObject: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    lblName: TLabel;
    edtnumberProject: TEdit;
    Label1: TLabel;
    edtStatusName: TEdit;
    lblStatus: TLabel;
    btnStatusSelect: TSpeedButton;
    lblENBudgetName: TLabel;
    spbENBudget: TSpeedButton;
    edtENBudgetName: TEdit;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENDepartmentDepartmentClick(Sender : TObject);
  procedure spbENElementElementClick(Sender : TObject);
    procedure btnStatusSelectClick(Sender: TObject);
    procedure spbENBudgetClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENServicesFromSideObjectFilterEdit: TfrmENServicesFromSideObjectFilterEdit;
  ENServicesFromSideObjectFilterObj: ENServicesFromSideObjectFilter;

implementation

uses
  ShowENDepartment
  ,ENDepartmentController
  ,ShowENElement
  ,ENElementController
, ShowENServFromSideStatus, ENServFromSideStatusController, ENConsts,
  ENDepartmentTypeController;

{uses  
    EnergyproController, EnergyproController2, ENServicesFromSideObjectController  ;
}
{$R *.dfm}



procedure TfrmENServicesFromSideObjectFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtContractNumber
      ,edtContractDate
      ,edtName
      ,edtPartnerCode
      ,edtFinDocCode
      ,edtFinDocID
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtContractNumber.Text := ENServicesFromSideObjectObj.contractNumber; 



      if ENServicesFromSideObjectObj.contractDate <> nil then
      begin
        edtContractDate.DateTime:=EncodeDate(ENServicesFromSideObjectObj.contractDate.Year,ENServicesFromSideObjectObj.contractDate.Month,ENServicesFromSideObjectObj.contractDate.Day);
        edtContractDate.checked := true;
      end
      else
      begin
        edtContractDate.DateTime:=SysUtils.Date;
        edtContractDate.checked := false;
      end;



    edtName.Text := ENServicesFromSideObjectObj.name; 



    edtPartnerCode.Text := ENServicesFromSideObjectObj.partnerCode; 



    edtFinDocCode.Text := ENServicesFromSideObjectObj.finDocCode; 



    if ( ENServicesFromSideObjectObj.finDocID <> Low(Integer) ) then
       edtFinDocID.Text := IntToStr(ENServicesFromSideObjectObj.finDocID)
    else
       edtFinDocID.Text := '';



    MakeMultiline(edtCommentGen.Lines, ENServicesFromSideObjectObj.commentGen);



    edtUserGen.Text := ENServicesFromSideObjectObj.userGen; 



      if ENServicesFromSideObjectObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENServicesFromSideObjectObj.dateEdit.Year,ENServicesFromSideObjectObj.dateEdit.Month,ENServicesFromSideObjectObj.dateEdit.Day);
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



procedure TfrmENServicesFromSideObjectFilterEdit.btnStatusSelectClick(
  Sender: TObject);
var
   frmENServFromSideStatusShow: TfrmENServFromSideStatusShow;
begin
   frmENServFromSideStatusShow:=TfrmENServFromSideStatusShow.Create(Application,fmNormal);
   try
      with frmENServFromSideStatusShow do
        if ShowModal = mrOk then
        begin
            try
               if ENServicesFromSideObjectFilterObj.statusRef = nil then
               ENServicesFromSideObjectFilterObj.statusRef := ENServFromSideStatusRef.Create();
               ENServicesFromSideObjectFilterObj.statusRef.code := StrToInt(GetReturnValue(sgENServFromSideStatus,0));
               edtStatusName.Text:=GetReturnValue(sgENServFromSideStatus,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENServFromSideStatusShow.Free;
   end;
end;

procedure TfrmENServicesFromSideObjectFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENServicesFromSideObject: ENServicesFromSideObjectControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENServicesFromSideObjectFilterObj.contractNumber := edtContractNumber.Text;



     if edtcontractDate.checked then
     begin 
       if ENServicesFromSideObjectFilterObj.contractDate = nil then
          ENServicesFromSideObjectFilterObj.contractDate := TXSDate.Create;
       ENServicesFromSideObjectFilterObj.contractDate.XSToNative(GetXSDate(edtcontractDate.DateTime));
     end
     else
       ENServicesFromSideObjectFilterObj.contractDate := nil;



     ENServicesFromSideObjectFilterObj.name := edtName.Text; 



     ENServicesFromSideObjectFilterObj.partnerCode := edtPartnerCode.Text; 



     ENServicesFromSideObjectFilterObj.finDocCode := edtFinDocCode.Text;



     if ( edtFinDocID.Text <> '' ) then
       ENServicesFromSideObjectFilterObj.finDocID := StrToInt(edtFinDocID.Text)
     else
       ENServicesFromSideObjectFilterObj.finDocID := Low(Integer) ;




     ENServicesFromSideObjectFilterObj.commentGen := edtCommentGen.Text; 



     ENServicesFromSideObjectFilterObj.userGen := edtUserGen.Text; 

     ENServicesFromSideObjectFilterObj.numberProject := edtnumberProject.Text;

     if edtdateEdit.checked then
     begin 
       if ENServicesFromSideObjectFilterObj.dateEdit = nil then
          ENServicesFromSideObjectFilterObj.dateEdit := TXSDate.Create;
       ENServicesFromSideObjectFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENServicesFromSideObjectFilterObj.dateEdit := nil;




  end;
end;

procedure TfrmENServicesFromSideObjectFilterEdit.spbENBudgetClick(
  Sender: TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;

begin
   f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.typeRef := ENDepartmentTypeRef.Create;
   f.typeRef.code := ENDEPARTMENTTYPE_BUDGET;
   f.conditionSQL := ' parentrefcode is null';

   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
   try

      with frmENDepartmentShow do begin
   //     DisableActions([ actNoFilter, actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try

            ENServicesFromSideObjectFilterObj.conditionSQL := ' code in (' +
              ' select distinct s2p.servfromsiderefcode ' +
              ' from  enservfromside2planwrk s2p, enplanwork pw ' +
              ' where pw.code = s2p.planrefcode ' +
              '   and pw.budgetrefcode = ' + IntToStr(ENDepartmentShort(tvDep.Selected.Data).code) + ')';
            edtENBudgetName.Text:=ENDepartmentShort(tvDep.Selected.Data).shortName ;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;

procedure TfrmENServicesFromSideObjectFilterEdit.spbENDepartmentDepartmentClick(Sender : TObject);
var 
   frmENDepartmentShow: TfrmENDepartmentShow;
begin
   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal);
   try
      with frmENDepartmentShow do
        if ShowModal = mrOk then
        begin
            try
               if ENServicesFromSideObjectFilterObj.department = nil then ENServicesFromSideObjectFilterObj.department := ENDepartment.Create();
               //ENServicesFromSideObjectFilterObj.department.code := StrToInt(GetReturnValue(sgENDepartment,0));
               //edtENDepartmentDepartmentName.Text:=GetReturnValue(sgENDepartment,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENDepartmentShow.Free;
   end;
end;


procedure TfrmENServicesFromSideObjectFilterEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENServicesFromSideObjectFilterObj.element = nil then ENServicesFromSideObjectFilterObj.element := ENElement.Create();
               ENServicesFromSideObjectFilterObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;





end.