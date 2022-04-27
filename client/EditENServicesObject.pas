
unit EditENServicesObject;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
  	EnergyproController, EnergyproController2, ENServicesObjectController ;

type
  TfrmENServicesObjectEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblContractNumber : TLabel;
    edtContractNumber: TEdit;
    lblContractDate : TLabel;
    edtContractDate: TDateTimePicker;
    lblName : TLabel;
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
  

  HTTPRIOENServicesObject: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    spbContractNumberSelect: TSpeedButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENDepartmentDepartmentClick(Sender : TObject);
  procedure spbENElementElementClick(Sender : TObject);
    procedure spbContractNumberSelectClick(Sender: TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENServicesObjectEdit: TfrmENServicesObjectEdit;
  ENServicesObjectObj: ENServicesObject;

implementation

uses
  ShowENDepartment
  ,ShowFINServicesObject
  ,ENDepartmentController
  ,ShowENElement
  ,ENElementController
  ,DMReportsUnit, ENConsts;

{uses  
    EnergyproController, EnergyproController2, ENServicesObjectController  ;
}
{$R *.dfm}



procedure TfrmENServicesObjectEdit.FormShow(Sender: TObject);

begin


  if DialogState = dsView then
  begin
//     DisableControls([
    DisableControls([
      edtENDepartmentDepartmentName
      ,spbENDepartmentDepartment
      ,edtENElementElementName
      ,spbENElementElement
      ,spbContractNumberSelect
       ]);
  end;

  DisableControls([edtENDepartmentDepartmentName]);

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtContractNumber
      ,edtContractDate
      ,edtName
      ,edtPartnerCode
      ,edtFinDocCode
      ,edtFinDocID
      ,edtENDepartmentDepartmentName
     ]);
   end;


  DisableControls([edtCode
                   ,edtContractDate
                   ,edtName
                   ,edtPartnerCode
                   ,edtFinDocCode
                   ,edtFinDocID
                   ,edtCommentGen
                  ]);

  if (DialogState = dsEdit) then
  begin
      DisableControls([spbENDepartmentDepartment], false);
      DisableControls([edtContractNumber, spbContractNumberSelect]);
      DenyBlankValues([edtENDepartmentDepartmentName]);

      ///// 28.07.10
      if ENServicesObjectObj.finDocID = LOW_INT then
      begin
        DisableControls([edtContractNumber, spbContractNumberSelect], false);
        DenyBlankValues([edtContractNumber]);
      end;
      /////
  end;

  ///// 28.07.10
  if (DialogState = dsInsert) then
  begin
    // Пусть в начале заводят руками, пока договора еще нет в ФинКол., а потом перебьется данными из ФинКол.
    DisableControls([edtContractDate, edtName], false);
    DenyBlankValues([edtContractDate, edtName]);
  end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENServicesObjectObj.code);
    edtContractNumber.Text := ENServicesObjectObj.contractNumber; 
      if ENServicesObjectObj.contractDate <> nil then
      begin
        edtContractDate.DateTime:=EncodeDate(ENServicesObjectObj.contractDate.Year,ENServicesObjectObj.contractDate.Month,ENServicesObjectObj.contractDate.Day);
        edtContractDate.checked := true;
      end
      else
      begin
        edtContractDate.DateTime:=SysUtils.Date;
        edtContractDate.checked := false;
      end;
    edtName.Text := ENServicesObjectObj.name; 
    edtPartnerCode.Text := ENServicesObjectObj.partnerCode; 
    edtFinDocCode.Text := ENServicesObjectObj.finDocCode; 
    if ( ENServicesObjectObj.finDocID <> Low(Integer) ) then
       edtFinDocID.Text := IntToStr(ENServicesObjectObj.finDocID)
    else
       edtFinDocID.Text := '';
    MakeMultiline(edtCommentGen.Lines, ENServicesObjectObj.commentGen);
    edtUserGen.Text := ENServicesObjectObj.userGen; 
      if ENServicesObjectObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENServicesObjectObj.dateEdit.Year,ENServicesObjectObj.dateEdit.Month,ENServicesObjectObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;

    edtENDepartmentDepartmentName.Text := ENServicesObjectObj.department.name;
    //edtENElementElementName.Text := ENServicesObjectObj.element.name;

  end;
end;



procedure TfrmENServicesObjectEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENServicesObject: ENServicesObjectControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtContractNumber
      ,edtName
      ///// 28.07.10
      //,edtPartnerCode
      //,edtFinDocCode
      //,edtFinDocID
      /////
      ,edtENDepartmentDepartmentName
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;


     ENServicesObjectObj.contractNumber := edtContractNumber.Text;

     if edtcontractDate.checked then
     begin
       if ENServicesObjectObj.contractDate = nil then
          ENServicesObjectObj.contractDate := TXSDate.Create;
       ENServicesObjectObj.contractDate.XSToNative(GetXSDate(edtcontractDate.DateTime));
     end
     else begin
        Application.MessageBox(PChar('Введите дату договора!'),PChar('Внимание!'), MB_ICONWARNING);
        Action := caNone;
        Exit;
        ENServicesObjectObj.contractDate := nil;
     end;

     ENServicesObjectObj.name := edtName.Text; 

     ENServicesObjectObj.partnerCode := edtPartnerCode.Text; 

     ENServicesObjectObj.finDocCode := edtFinDocCode.Text; 

     if ( edtFinDocID.Text <> '' ) then
       ENServicesObjectObj.finDocID := StrToInt(edtFinDocID.Text)
     else
       ENServicesObjectObj.finDocID := Low(Integer) ;

     ENServicesObjectObj.commentGen := edtCommentGen.Text; 

     ENServicesObjectObj.userGen := edtUserGen.Text; 

     if edtdateEdit.checked then
     begin 
       if ENServicesObjectObj.dateEdit = nil then
          ENServicesObjectObj.dateEdit := TXSDate.Create;
       ENServicesObjectObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENServicesObjectObj.dateEdit := nil;

    if DialogState = dsInsert then
    begin
      ENServicesObjectObj.code:=low(Integer);
      TempENServicesObject.add(ENServicesObjectObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENServicesObject.save(ENServicesObjectObj);
    end;
  end;
end;


procedure TfrmENServicesObjectEdit.spbENDepartmentDepartmentClick(Sender : TObject);
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
               if ENServicesObjectObj.department = nil then ENServicesObjectObj.department := ENDepartment.Create();
               ENServicesObjectObj.department.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtENDepartmentDepartmentName.Text := ENDepartmentShort(tvDep.Selected.Data).shortName;
               if  ENServicesObjectObj.element = nil then  ENServicesObjectObj.element := ENElement.Create;
               if  ENServicesObjectObj.element.renRef = nil then ENServicesObjectObj.element.renRef := EPRenRef.Create;
               ENServicesObjectObj.element.renRef.code := StrToInt(DMReports.getEPRenByDepartmentCode(ENServicesObjectObj.department.code));
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;



procedure TfrmENServicesObjectEdit.spbENElementElementClick(Sender : TObject);
var
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENServicesObjectObj.element = nil then ENServicesObjectObj.element := ENElement.Create();
               ENServicesObjectObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;



procedure TfrmENServicesObjectEdit.spbContractNumberSelectClick(Sender: TObject);
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

   //f.conditionSQL := 'a.io_flag = ''S'' and a.agree_group_id in (205, 342, 319, 88, 201, 218, 303, 198, 50, 206, 338, 44)';
   f.conditionSQL := 'a.io_flag = ''S'' and a.agree_group_id in (' + AGREES_GROUPS_IDS + ')';

   frmFINServicesObjectShow:=TfrmFINServicesObjectShow.Create(Application,fmNormal, f);
   frmFINServicesObjectShow.contrAgentType := AX_CONTRAGENT_TYPE_CUSTOMER;
   try
      with frmFINServicesObjectShow do
        if ShowModal = mrOk then
        begin
            try
{
        Cells[1,i+1] := ENServicesObjectList.list[i].contractNumber;
        if ENServicesObjectList.list[i].contractDate = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(ENServicesObjectList.list[i].contractDate);
        Cells[3,i+1] := ENServicesObjectList.list[i].name;
        Cells[4,i+1] := ENServicesObjectList.list[i].partnerCode;
        Cells[5,i+1] := ENServicesObjectList.list[i].finDocCode;
        if ENServicesObjectList.list[i].finDocID = Low(Integer) then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := IntToStr(ENServicesObjectList.list[i].finDocID);
        Cells[7,i+1] := ENServicesObjectList.list[i].commentGen;
}
                edtContractNumber.Text := GetReturnValue(sgFINServicesObject, 1);
                edtContractDate.DateTime := StrToDate(GetReturnValue(sgFINServicesObject, 2));
                edtContractDate.Checked := true;
                edtName.Text := GetReturnValue(sgFINServicesObject, 3);
                edtPartnerCode.Text := GetReturnValue(sgFINServicesObject, 4);
                edtFinDocCode.Text :=  GetReturnValue(sgFINServicesObject, 5);
                edtFinDocID.Text :=  GetReturnValue(sgFINServicesObject, 6);
                edtCommentGen.Text :=  GetReturnValue(sgFINServicesObject, 7);

                ///// 28.07.10
                DisableControls([edtCode
                                 ,edtContractDate
                                 ,edtName
                                 ,edtPartnerCode
                                 ,edtFinDocCode
                                 ,edtFinDocID
                                 ,edtCommentGen
                                 ,edtContractDate //??? че его не было??
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