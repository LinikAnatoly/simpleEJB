
unit EditENTechConditionsServicesFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTechConditionsServicesController ;

type
  TfrmENTechConditionsServicesFilterEdit = class(TDialogForm)

    lblContractNumber : TLabel;
    edtContractNumber: TEdit;

    lblContractDate : TLabel;
    edtContractDateFrom: TDateTimePicker;
    lblFinContractNumber : TLabel;
    edtFinContractNumber: TEdit;

    lblFinContractDate : TLabel;
    edtFinContractDateFrom: TDateTimePicker;
    lblPartnerName : TLabel;
    edtPartnerName: TEdit;

    lblPartnerCode : TLabel;
    edtPartnerCode: TEdit;

    lblFinDocCode : TLabel;
    edtFinDocCode: TEdit;

    lblFinDocID : TLabel;
    edtFinDocID: TEdit;

    lblFinCommentGen : TLabel;
    edtFinCommentGen: TMemo;

    lblContragentName : TLabel;
    edtContragentName: TEdit;

    lblContragentAddress : TLabel;
    edtContragentAddress: TMemo;

    lblContragentAddressWork : TLabel;
    edtContragentAddressWork: TMemo;

    lblContragentOkpo : TLabel;
    edtContragentOkpo: TEdit;

    lblContragentBankAccount : TLabel;
    edtContragentBankAccount: TEdit;

    lblContragentBankName : TLabel;
    edtContragentBankName: TEdit;

    lblContragentBankMfo : TLabel;
    edtContragentBankMfo: TEdit;

    lblContragentBossName : TLabel;
    edtContragentBossName: TEdit;

    lblContragentPassport : TLabel;
    edtContragentPassport: TMemo;

    lblTyServicesSumma : TLabel;
    edtTyServicesSumma: TEdit;

    lblTyServicesPower : TLabel;
    edtTyServicesPower: TEdit;

    lblCommentServicesGen : TLabel;
    edtCommentServicesGen: TMemo;
    lblWarrantDate : TLabel;
    edtWarrantDate: TDateTimePicker;
    lblWarrantNumber : TLabel;
    edtWarrantNumber: TEdit;

    lblWarrantFIO : TLabel;
    edtWarrantFIO: TEdit;


  lblENTechConditionsServicesStatusTechCondServicesStatusName : TLabel;
  edtENTechConditionsServicesStatusTechCondServicesStatusName : TEdit;
  spbENTechConditionsServicesStatusTechCondServicesStatus : TSpeedButton;
  
  lblENTechConditionsServicesTypeTechCondServicesTypeName : TLabel;
  edtENTechConditionsServicesTypeTechCondServicesTypeName : TEdit;
  spbENTechConditionsServicesTypeTechCondServicesType : TSpeedButton;
  
  lblENTechContragentFormContragentFormName : TLabel;
  edtENTechContragentFormContragentFormName : TEdit;
  spbENTechContragentFormContragentForm : TSpeedButton;
  
  lblENServicesContragentTypeContragentTypeName : TLabel;
  edtENServicesContragentTypeContragentTypeName : TEdit;
  spbENServicesContragentTypeContragentType : TSpeedButton;

  btnOk: TButton;
  btnCancel: TButton;
    Label2: TLabel;
    edtResponsiblePerson: TEdit;
    spbResponsiblePerson: TSpeedButton;
    Label1: TLabel;
    Label3: TLabel;
    edtContractDateTo: TDateTimePicker;
    lbl7: TLabel;
    edtCNPackCode: TEdit;
    spbCNPack: TSpeedButton;
    edtTySummaGen: TEdit;
    lbltysummagen: TLabel;
    lbl8: TLabel;
    edtENDepartmentDepartmentName: TEdit;
    spbENDepartmentDepartment: TSpeedButton;
    edtFinContractDateTo: TDateTimePicker;
    Label4: TLabel;
    Label5: TLabel;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbResponsiblePersonClick(Sender: TObject);
    procedure spbCNPackClick(Sender: TObject);
    procedure spbENDepartmentDepartmentClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENTechConditionsServicesFilterEdit: TfrmENTechConditionsServicesFilterEdit;
  ENTechConditionsServicesFilterObj: ENTechConditionsServicesFilter;

implementation

uses
  //ShowENTechConditionsServicesStatus
  ENTechConditionsServicesStatusController
  //,ShowENTechConditionsServicesType
  ,ENTechConditionsServicesTypeController
  //,ShowENTechContragentForm
  ,ENTechContragentFormController
  //,ShowENServicesContragentType
  ,ENServicesContragentTypeController
, ShowENTechCondResponsibles, ENTechCondResponsiblesController, ShowCNPack,
  ShowENDepartment, ENDepartmentController;

{uses  
    EnergyproController, EnergyproController2, ENTechConditionsServicesController  ;
}
{$R *.dfm}



procedure TfrmENTechConditionsServicesFilterEdit.FormShow(Sender: TObject);
begin
  DisableControls([edtENDepartmentDepartmentName, edtResponsiblePerson, edtCNPackCode]);
  SetFloatStyle([edtTySummaGen, edtTyServicesSumma, edtTyServicesPower]);

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtContractNumber
      ,edtContractDate
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtContractNumber.Text := ENTechConditionsServicesObj.contractNumber;



      if ENTechConditionsServicesObj.contractDate <> nil then
      begin
        edtContractDate.DateTime:=EncodeDate(ENTechConditionsServicesObj.contractDate.Year,ENTechConditionsServicesObj.contractDate.Month,ENTechConditionsServicesObj.contractDate.Day);
        edtContractDate.checked := true;
      end
      else
      begin
        edtContractDate.DateTime:=SysUtils.Date;
        edtContractDate.checked := false;
      end;



    edtFinContractNumber.Text := ENTechConditionsServicesObj.finContractNumber; 



      if ENTechConditionsServicesObj.finContractDate <> nil then
      begin
        edtFinContractDate.DateTime:=EncodeDate(ENTechConditionsServicesObj.finContractDate.Year,ENTechConditionsServicesObj.finContractDate.Month,ENTechConditionsServicesObj.finContractDate.Day);
        edtFinContractDate.checked := true;
      end
      else
      begin
        edtFinContractDate.DateTime:=SysUtils.Date;
        edtFinContractDate.checked := false;
      end;



    edtPartnerName.Text := ENTechConditionsServicesObj.partnerName;



    edtPartnerCode.Text := ENTechConditionsServicesObj.partnerCode; 



    edtFinDocCode.Text := ENTechConditionsServicesObj.finDocCode; 



    if ( ENTechConditionsServicesObj.finDocID <> Low(Integer) ) then
       edtFinDocID.Text := IntToStr(ENTechConditionsServicesObj.finDocID)
    else
       edtFinDocID.Text := '';



    MakeMultiline(edtFinCommentGen.Lines, ENTechConditionsServicesObj.finCommentGen);



    edtContragentName.Text := ENTechConditionsServicesObj.contragentName;



    MakeMultiline(edtContragentAddress.Lines, ENTechConditionsServicesObj.contragentAddress);



    MakeMultiline(edtContragentAddressWork.Lines, ENTechConditionsServicesObj.contragentAddressWork);



    edtContragentOkpo.Text := ENTechConditionsServicesObj.contragentOkpo;



    edtContragentBankAccount.Text := ENTechConditionsServicesObj.contragentBankAccount; 



    edtContragentBankName.Text := ENTechConditionsServicesObj.contragentBankName; 



    edtContragentBankMfo.Text := ENTechConditionsServicesObj.contragentBankMfo; 



    edtContragentBossName.Text := ENTechConditionsServicesObj.contragentBossName; 



    MakeMultiline(edtContragentPassport.Lines, ENTechConditionsServicesObj.contragentPassport);



    if ( ENTechConditionsServicesObj.tyServicesSumma <> nil ) then
       edtTyServicesSumma.Text := ENTechConditionsServicesObj.tyServicesSumma.decimalString
    else
       edtTyServicesSumma.Text := ''; 



    if ( ENTechConditionsServicesObj.tyServicesPower <> nil ) then
       edtTyServicesPower.Text := ENTechConditionsServicesObj.tyServicesPower.decimalString
    else
       edtTyServicesPower.Text := '';



    MakeMultiline(edtCommentServicesGen.Lines, ENTechConditionsServicesObj.commentServicesGen);



    edtUserGen.Text := ENTechConditionsServicesObj.userGen; 



      if ENTechConditionsServicesObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENTechConditionsServicesObj.dateEdit.Year,ENTechConditionsServicesObj.dateEdit.Month,ENTechConditionsServicesObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;



      if ENTechConditionsServicesObj.warrantDate <> nil then
      begin
        edtWarrantDate.DateTime:=EncodeDate(ENTechConditionsServicesObj.warrantDate.Year,ENTechConditionsServicesObj.warrantDate.Month,ENTechConditionsServicesObj.warrantDate.Day);
        edtWarrantDate.checked := true;
      end
      else
      begin
        edtWarrantDate.DateTime:=SysUtils.Date;
        edtWarrantDate.checked := false;
      end;



    edtWarrantNumber.Text := ENTechConditionsServicesObj.warrantNumber; 



    edtWarrantFIO.Text := ENTechConditionsServicesObj.warrantFIO; 


  end;

}

end;



procedure TfrmENTechConditionsServicesFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTechConditionsServices: ENTechConditionsServicesControllerSoapPort;
    condition, strContragentNameCondition: String;
begin
  if (ModalResult = mrOk)  then
  begin
     condition := ENTechConditionsServicesFilterObj.conditionSQL;

     ENTechConditionsServicesFilterObj.contractNumber := edtContractNumber.Text;


     {
     if edtcontractDate.checked then
     begin
       if ENTechConditionsServicesFilterObj.contractDate = nil then
          ENTechConditionsServicesFilterObj.contractDate := TXSDate.Create;
       ENTechConditionsServicesFilterObj.contractDate.XSToNative(GetXSDate(edtcontractDate.DateTime));
     end
     else
       ENTechConditionsServicesFilterObj.contractDate := nil;
     }

     if edtContractDateFrom.Checked then
       AddCondition(condition, 'entechconditionsservcs.contractdate >= to_date(''' + DateToStr(edtContractDateFrom.Date) + ''', ''dd.MM.yyyy'')');

     if edtContractDateTo.Checked then
       AddCondition(condition, 'entechconditionsservcs.contractdate <= to_date(''' + DateToStr(edtContractDateTo.Date) + ''', ''dd.MM.yyyy'')');

     ENTechConditionsServicesFilterObj.finContractNumber := edtFinContractNumber.Text;

    { if edtfinContractDate.checked then
     begin
       if ENTechConditionsServicesFilterObj.finContractDate = nil then
          ENTechConditionsServicesFilterObj.finContractDate := TXSDate.Create;
       ENTechConditionsServicesFilterObj.finContractDate.XSToNative(GetXSDate(edtfinContractDate.DateTime));
     end
     else
       ENTechConditionsServicesFilterObj.finContractDate := nil;
     }
     if edtFinContractDateFrom.Checked then
       AddCondition(condition, 'entechconditionsservcs.fincontractdate >= to_date(''' + DateToStr(edtFinContractDateFrom.Date) + ''', ''dd.MM.yyyy'')');

     if edtFinContractDateTo.Checked then
       AddCondition(condition, 'entechconditionsservcs.fincontractdate <= to_date(''' + DateToStr(edtFinContractDateTo.Date) + ''', ''dd.MM.yyyy'')');



     ENTechConditionsServicesFilterObj.partnerName := edtPartnerName.Text;



     ENTechConditionsServicesFilterObj.partnerCode := edtPartnerCode.Text;



     ENTechConditionsServicesFilterObj.finDocCode := edtFinDocCode.Text;



     if ( edtFinDocID.Text <> '' ) then
       ENTechConditionsServicesFilterObj.finDocID := StrToInt(edtFinDocID.Text)
     else
       ENTechConditionsServicesFilterObj.finDocID := Low(Integer) ;




     ENTechConditionsServicesFilterObj.finCommentGen := edtFinCommentGen.Text;


     if (ENTechConditionsServicesFilterObj.tySummaGen = nil) then
       ENTechConditionsServicesFilterObj.tySummaGen := TXSDecimal.Create;
     if edtTySummaGen.Text <> '' then
       ENTechConditionsServicesFilterObj.tySummaGen.DecimalString := edtTySummaGen.Text
     else
       ENTechConditionsServicesFilterObj.tySummaGen := nil;


     if (ENTechConditionsServicesFilterObj.tyServicesSumma = nil ) then
       ENTechConditionsServicesFilterObj.tyServicesSumma := TXSDecimal.Create;
     if edtTyServicesSumma.Text <> '' then
       ENTechConditionsServicesFilterObj.tyServicesSumma.decimalString := edtTyServicesSumma.Text
     else
       ENTechConditionsServicesFilterObj.tyServicesSumma := nil;




     if (ENTechConditionsServicesFilterObj.tyServicesPower = nil ) then
       ENTechConditionsServicesFilterObj.tyServicesPower := TXSDecimal.Create;
     if edtTyServicesPower.Text <> '' then
       ENTechConditionsServicesFilterObj.tyServicesPower.decimalString := edtTyServicesPower.Text
     else
       ENTechConditionsServicesFilterObj.tyServicesPower := nil;

     ENTechConditionsServicesFilterObj.commentServicesGen := edtCommentServicesGen.Text;


     if edtContragentName.Text <> '' then
     begin
       {
         if (aFilterObject.contragentName.indexOf('*',0) < 0 && aFilterObject.contragentName.indexOf('?',0) < 0)
             whereStr = whereStr + "  UPPER(ENCONTRAGENT.CONTRAGENTNAME) = UPPER(?)";
         else
             whereStr = whereStr + " UPPER(ENCONTRAGENT.CONTRAGENTNAME) LIKE UPPER(?)";
       }
       if (pos('*', edtContragentName.Text) = 0) and (pos('?', edtContragentName.Text) = 0) then
         strContragentNameCondition := 'UPPER(c.contragentname) = UPPER(''' + edtContragentName.Text + ''')'
       else
         strContragentNameCondition := 'UPPER(c.contragentname) like UPPER(''' + ToLIKE(edtContragentName.Text) + ''')';

       AddCondition(condition, 'entechconditionsservcs.code in ' +
                               '(select c.techcondservicesrefcod from encontragent c where ' + strContragentNameCondition + ')');
     end;

      AddCondition(condition, ' entechconditionsservcs.code not in (select s2t.techcondservrefcode from enservicesobject2techcondtnsservices s2t)');

     ENTechConditionsServicesFilterObj.conditionSQL := condition;
  end;
end;

procedure TfrmENTechConditionsServicesFilterEdit.spbResponsiblePersonClick(
  Sender: TObject);
var frmENTechCondResponsiblesShow: TfrmENTechCondResponsiblesShow;
begin
  frmENTechCondResponsiblesShow := TfrmENTechCondResponsiblesShow.Create(Application, fmNormal);
  try
    with frmENTechCondResponsiblesShow do
    begin
      DisableActions([actInsert, actEdit, actDelete]);
      sgENTechCondResponsibles.ColWidths[2] := 0;
      //sgENTechCondResponsibles.ColWidths[4] := 0;
      
      if ShowModal = mrOk then
      begin
        try
          if ENTechConditionsServicesFilterObj.techCondResponsiblesRef = nil then
            ENTechConditionsServicesFilterObj.techCondResponsiblesRef := ENTechCondResponsiblesRef.Create;
          ENTechConditionsServicesFilterObj.techCondResponsiblesRef.code := StrToInt(GetReturnValue(sgENTechCondResponsibles, 0));
          edtResponsiblePerson.Text := GetReturnValue(sgENTechCondResponsibles, 1);
        except
          on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmENTechCondResponsiblesShow.Free;
  end;
end;

procedure TfrmENTechConditionsServicesFilterEdit.spbCNPackClick(
  Sender: TObject);
var
   frmCNPackShow: TfrmCNPackShow;
begin
  frmCNPackShow := TfrmCNPackShow.Create(Application, fmNormal);
  try
    with frmCNPackShow do
    begin
      if ShowModal = mrOk then
      begin
        try
          ENTechConditionsServicesFilterObj.cnPackCode := StrToInt(GetReturnValue(sgCNPack, 1));
          edtCNPackCode.Text := GetReturnValue(sgCNPack, 1);
        except
          on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmCNPackShow.Free;
  end;
end;

procedure TfrmENTechConditionsServicesFilterEdit.spbENDepartmentDepartmentClick(
  Sender: TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin
   f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);

   f.code := 1;

   frmENDepartmentShow := TfrmENDepartmentShow.Create(Application, fmNormal, f);
   try
      with frmENDepartmentShow do
        if ShowModal = mrOk then
        begin
            try
               if ENTechConditionsServicesFilterObj.department = nil then ENTechConditionsServicesFilterObj.department := ENDepartment.Create();
               ENTechConditionsServicesFilterObj.department.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtENDepartmentDepartmentName.Text:= ENDepartmentShort(tvDep.Selected.Data).shortName;
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENDepartmentShow.Free;
   end;
end;

end.
