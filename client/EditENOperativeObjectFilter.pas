
unit EditENOperativeObjectFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	  EnergyproController, EnergyproController2, ENOperativeObjectController ;

type
  TfrmENOperativeObjectFilterEdit = class(TDialogForm)
    lblName: TLabel;
    lblCommentGen: TLabel;
    spbENDepartmentDepartment: TSpeedButton;
    lblENDepartmentDepartmentName: TLabel;
    edtName: TEdit;
    edtCommentGen: TMemo;
    edtENDepartmentDepartmentName: TEdit;
    btnOk: TButton;
    btnCancel: TButton;
    GroupBox1: TGroupBox;
    lblContractNumber: TLabel;
    lblContractDate: TLabel;
    lblPartnerCode: TLabel;
    lblPartnerName: TLabel;
    spbContractNumberSelect: TSpeedButton;
    edtContractNumber: TEdit;
    edtContractDate: TDateTimePicker;
    edtPartnerCode: TEdit;
    edtPartnerName: TEdit;
    HTTPRIOENOperativeObject: THTTPRIO;
    lblFinDocCode: TLabel;
    lblFinDocID: TLabel;
    edtFinDocCode: TEdit;
    edtFinDocID: TEdit;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENDepartmentDepartmentClick(Sender : TObject);
  procedure spbContractNumberSelectClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENOperativeObjectFilterEdit: TfrmENOperativeObjectFilterEdit;
  ENOperativeObjectFilterObj: ENOperativeObjectFilter;

implementation

uses
  ShowENDepartment
  ,ENDepartmentController
  ,ShowENElement
  ,ENElementController, ENConsts
  ,DMReportsUnit, ShowFINServicesObject, ENServicesObjectController;

{uses  
    EnergyproController, EnergyproController2, ENOperativeObjectController  ;
}
{$R *.dfm}



procedure TfrmENOperativeObjectFilterEdit.FormShow(Sender: TObject);
begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
    DisableControls([edtENDepartmentDepartmentName{,
                     edtContractNumber, edtContractDate,
                     edtPartnerCode, edtPartnerName,
                     edtFinDocCode, edtFinDocID}]);
                     
{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtContractNumber
      ,edtContractDate
      ,edtPartnerCode
      ,edtPartnerName
      ,edtFinDocCode
      ,edtFinDocID
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENOperativeObjectObj.name; 



    MakeMultiline(edtCommentGen.Lines, ENOperativeObjectObj.commentGen);



    edtContractNumber.Text := ENOperativeObjectObj.contractNumber; 



      if ENOperativeObjectObj.contractDate <> nil then
      begin
        edtContractDate.DateTime:=EncodeDate(ENOperativeObjectObj.contractDate.Year,ENOperativeObjectObj.contractDate.Month,ENOperativeObjectObj.contractDate.Day);
        edtContractDate.checked := true;
      end
      else
      begin
        edtContractDate.DateTime:=SysUtils.Date;
        edtContractDate.checked := false;
      end;



    edtPartnerCode.Text := ENOperativeObjectObj.partnerCode; 



    edtPartnerName.Text := ENOperativeObjectObj.partnerName; 



    edtFinDocCode.Text := ENOperativeObjectObj.finDocCode; 



    if ( ENOperativeObjectObj.finDocID <> Low(Integer) ) then
       edtFinDocID.Text := IntToStr(ENOperativeObjectObj.finDocID)
    else
       edtFinDocID.Text := '';


  end;

}

end;



procedure TfrmENOperativeObjectFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENOperativeObject: ENOperativeObjectControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENOperativeObjectFilterObj.name := edtName.Text; 



     ENOperativeObjectFilterObj.commentGen := edtCommentGen.Text; 



     ENOperativeObjectFilterObj.contractNumber := edtContractNumber.Text; 



     if edtcontractDate.checked then
     begin 
       if ENOperativeObjectFilterObj.contractDate = nil then
          ENOperativeObjectFilterObj.contractDate := TXSDate.Create;
       ENOperativeObjectFilterObj.contractDate.XSToNative(GetXSDate(edtcontractDate.DateTime));
     end
     else
       ENOperativeObjectFilterObj.contractDate := nil;



     ENOperativeObjectFilterObj.partnerCode := edtPartnerCode.Text; 



     ENOperativeObjectFilterObj.partnerName := edtPartnerName.Text; 



     ENOperativeObjectFilterObj.finDocCode := edtFinDocCode.Text;



     if ( edtFinDocID.Text <> '' ) then
       ENOperativeObjectFilterObj.finDocID := StrToInt(edtFinDocID.Text)
     else
       ENOperativeObjectFilterObj.finDocID := Low(Integer) ;





  end;
end;

procedure TfrmENOperativeObjectFilterEdit.spbENDepartmentDepartmentClick(Sender : TObject);
var 
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin
  f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   //f.typeRef := ENDepartmentTypeRef.Create;
   //f.typeRef.code := 0; // предприятие ХОЕ ... ENDEPARTMENTTYPE_DEPARTMENT;
   //f.conditionSQL := ' parentrefcode is null';
   //f.conditionSQL :=

   f.code := 1;
   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
   try
      frmENDepartmentShow.isShowAll := true;
      with frmENDepartmentShow do begin
   //     DisableActions([ actNoFilter, actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               if ENOperativeObjectFilterObj.department = nil then ENOperativeObjectFilterObj.department := ENDepartment.Create();
               ENOperativeObjectFilterObj.department.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtENDepartmentDepartmentName.Text := ENDepartmentShort(tvDep.Selected.Data).shortName;
               //if  ENOperativeObjectFilterObj.element = nil then  ENOperativeObjectFilterObj.element := ENElement.Create;
               //if  ENOperativeObjectFilterObj.element.renRef = nil then ENOperativeObjectFilterObj.element.renRef := EPRenRef.Create;
               //ENOperativeObjectFilterObj.element.renRef.code := StrToInt(DMReports.getEPRenByDepartmentCode(ENOperativeObjectFilterObj.department.code));
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;

end;


procedure TfrmENOperativeObjectFilterEdit.spbContractNumberSelectClick(
  Sender: TObject);
var
   frmFINServicesObjectShow: TfrmFINServicesObjectShow;
   f : ENServicesObjectFilter;
begin
// чуть шо добавть группы если не будут нужных договоров
// в ДАО метод getContractList ... сейчас 205 - лабораторные работы
// !!!!
// уже перехало ... юзаеться в клиенте !!! + в Строках Заявки ...

   f := ENServicesObjectFilter.Create();
   SetNullXSProps(f);
   SetNullIntProps(f);

   if (edtContractNumber.Text <> '') then
     f.contractNumber := edtContractNumber.Text
   else
     f.contractNumber := '-1';

   f.conditionSQL := 'a.io_flag = ''S'' and a.agree_group_id in (205, 342, 319, 88, 201, 218, 303, 198, 50, 206, 338)';

   frmFINServicesObjectShow := TfrmFINServicesObjectShow.Create(Application,fmNormal, f);
   frmFINServicesObjectShow.contrAgentType := AX_CONTRAGENT_TYPE_CUSTOMER;
   try
      with frmFINServicesObjectShow do
        if ShowModal = mrOk then
        begin
            try
              edtContractNumber.Text := GetReturnValue(sgFINServicesObject, 1);
              edtContractDate.DateTime := StrToDate(GetReturnValue(sgFINServicesObject, 2));
              edtContractDate.Checked := true;
              edtPartnerName.Text := GetReturnValue(sgFINServicesObject, 3);
              edtPartnerCode.Text := GetReturnValue(sgFINServicesObject, 4);
              edtFinDocCode.Text :=  GetReturnValue(sgFINServicesObject, 5);
              edtFinDocID.Text :=  GetReturnValue(sgFINServicesObject, 6);
              //edtCommentGen.Text :=  GetReturnValue(sgFINServicesObject, 7);

              ///// 
              DisableControls([{edtCode
                               ,}edtContractDate
                               ,edtPartnerName
                               ,edtPartnerCode
                               ,edtFinDocCode
                               ,edtFinDocID
                               //,edtCommentGen
                              ]);
              /////
            except
              on EConvertError do Exit;
            end;
        end;
   finally
      frmFINServicesObjectShow.Free;
   end;
end;

end.