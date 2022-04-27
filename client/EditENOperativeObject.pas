
unit EditENOperativeObject;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENOperativeObjectController ;

type
  TfrmENOperativeObjectEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TMemo;
    lblFinDocCode : TLabel;
    edtFinDocCode: TEdit;
    lblFinDocID : TLabel;
    edtFinDocID: TEdit;

  lblENDepartmentDepartmentName : TLabel;
  edtENDepartmentDepartmentName : TEdit;
  spbENDepartmentDepartment : TSpeedButton;
  

  HTTPRIOENOperativeObject: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    GroupBox1: TGroupBox;
    lblContractNumber: TLabel;
    edtContractNumber: TEdit;
    lblContractDate: TLabel;
    edtContractDate: TDateTimePicker;
    lblPartnerCode: TLabel;
    edtPartnerCode: TEdit;
    lblPartnerName: TLabel;
    edtPartnerName: TEdit;
    spbContractNumberSelect: TSpeedButton;
    lblGeograph: TLabel;
    edtGeograph: TEdit;
    btnGeograph: TSpeedButton;
    btnGeographClear: TSpeedButton;
    HTTPRIOENGeographicDepartment: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENDepartmentDepartmentClick(Sender : TObject);
    procedure spbContractNumberSelectClick(Sender: TObject);
    procedure btnGeographClick(Sender: TObject);
    procedure btnGeographClearClick(Sender: TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENOperativeObjectEdit: TfrmENOperativeObjectEdit;
  ENOperativeObjectObj: ENOperativeObject;

implementation

uses
  ShowENDepartment
  ,ENDepartmentController
  ,ShowENElement
  ,ENElementController
, DMReportsUnit, ShowFINServicesObject, ENServicesObjectController,
  ENConsts, ShowENGeographicDepartment, ENGeographicDepartmentController;

{uses  
    EnergyproController, EnergyproController2, ENOperativeObjectController  ;
}
{$R *.dfm}



procedure TfrmENOperativeObjectEdit.FormShow(Sender: TObject);
var
  TempENGeographicDepartment: ENGeographicDepartmentControllerSoapPort;
  ENGeographicDepartmentObj : ENGeographicDepartment;
begin
  DisableControls([edtCode , edtGeograph ]);

  if DialogState = dsView then
  begin
//     DisableControls([
    DisableControls([
      edtENDepartmentDepartmentName
      ,spbENDepartmentDepartment
      ,spbContractNumberSelect
      //,edtENElementElementName
      //,spbENElementElement
       ]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DisableControls([edtENDepartmentDepartmentName,
                     edtContractNumber, edtContractDate,
                     edtPartnerCode, edtPartnerName,
                     edtFinDocCode, edtFinDocID]);
    DenyBlankValues([
      edtName
      ,edtENDepartmentDepartmentName
      ,edtContractNumber
      {,edtContractDate
      ,edtPartnerCode
      ,edtPartnerName
      ,edtFinDocCode
      ,edtFinDocID}
     ]);
    HideControls([lblCode, edtCode]);
  end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    if ENOperativeObjectObj.element.geoDepartmentRef <> nil then
      if ENOperativeObjectObj.element.geoDepartmentRef.code <> LOW_INT then
       begin
         // geodept
        TempENGeographicDepartment := HTTPRIOENGeographicDepartment as ENGeographicDepartmentControllerSoapPort;
        try
          ENGeographicDepartmentObj := TempENGeographicDepartment.getObject( ENOperativeObjectObj.element.geoDepartmentRef.code );
          edtGeograph.Text := ENGeographicDepartmentObj.name;
        except
          on EConvertError do Exit;
        end;
       end;

    edtCode.Text := IntToStr(ENOperativeObjectObj.code);
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

    edtENDepartmentDepartmentName.Text := ENOperativeObjectObj.department.name;
//    edtENElementElementName.Text := ENOperativeObjectObj.element.name;

  end;
end;



procedure TfrmENOperativeObjectEdit.btnGeographClearClick(Sender: TObject);
begin
   ENOperativeObjectObj.element.geoDepartmentRef.code := LOW_INT;
   edtGeograph.Text := '';

end;

procedure TfrmENOperativeObjectEdit.btnGeographClick(Sender: TObject);
var
   frmENGeographicDepartmentShow: TfrmENGeographicDepartmentShow;
   Filter : ENGeographicDepartmentFilter;
   selected : ENGeographicDepartmentShort;
begin
  Filter := ENGeographicDepartmentFilter.Create;
  SetNullIntProps(Filter);
  SetNullXSProps(Filter);


  frmENGeographicDepartmentShow := TfrmENGeographicDepartmentShow.Create(Application, fmNormal, Filter);
  try
      with frmENGeographicDepartmentShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selected := ENGeographicDepartmentShort(sgENGeographicDepartment.Objects[0, sgENGeographicDepartment.Row]);
                except
                   on EConvertError do begin  Exit; end;
                end;
                 ENOperativeObjectObj.element.geoDepartmentRef.code := selected.code;
                 edtGeograph.Text := selected.name;
            end;
          end;
   finally
      frmENGeographicDepartmentShow.Free;
   end;
end;

procedure TfrmENOperativeObjectEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENOperativeObject: ENOperativeObjectControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
      ,edtENDepartmentDepartmentName
      ,edtContractNumber
      ,edtPartnerCode
      ,edtPartnerName
      ,edtFinDocCode
      ,edtFinDocID
     ])  then
  begin
      Application.MessageBox(PChar('Заповніть обов''язкові поля!'),PChar('Увага!'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENOperativeObject := HTTPRIOENOperativeObject as ENOperativeObjectControllerSoapPort;


     ENOperativeObjectObj.name := edtName.Text; 

     ENOperativeObjectObj.commentGen := edtCommentGen.Text; 

     ENOperativeObjectObj.contractNumber := edtContractNumber.Text; 

     if edtcontractDate.checked then
     begin 
       if ENOperativeObjectObj.contractDate = nil then
          ENOperativeObjectObj.contractDate := TXSDate.Create;
       ENOperativeObjectObj.contractDate.XSToNative(GetXSDate(edtcontractDate.DateTime));
     end
     else
       ENOperativeObjectObj.contractDate := nil;

     ENOperativeObjectObj.partnerCode := edtPartnerCode.Text; 

     ENOperativeObjectObj.partnerName := edtPartnerName.Text; 

     ENOperativeObjectObj.finDocCode := edtFinDocCode.Text; 

     if ( edtFinDocID.Text <> '' ) then
       ENOperativeObjectObj.finDocID := StrToInt(edtFinDocID.Text)
     else
       ENOperativeObjectObj.finDocID := Low(Integer) ;

    if DialogState = dsInsert then
    begin
      ENOperativeObjectObj.code:=low(Integer);
      TempENOperativeObject.add(ENOperativeObjectObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENOperativeObject.save(ENOperativeObjectObj);
    end;
  end;
end;


procedure TfrmENOperativeObjectEdit.spbENDepartmentDepartmentClick(Sender : TObject);
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
               if ENOperativeObjectObj.department = nil then ENOperativeObjectObj.department := ENDepartment.Create();
               ENOperativeObjectObj.department.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtENDepartmentDepartmentName.Text := ENDepartmentShort(tvDep.Selected.Data).shortName;
               if  ENOperativeObjectObj.element = nil then  ENOperativeObjectObj.element := ENElement.Create;
               if  ENOperativeObjectObj.element.renRef = nil then ENOperativeObjectObj.element.renRef := EPRenRef.Create;
               ENOperativeObjectObj.element.renRef.code := StrToInt(DMReports.getEPRenByDepartmentCode(ENOperativeObjectObj.department.code));
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;

{
   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal);
   try
      with frmENDepartmentShow do
        if ShowModal = mrOk then
        begin
            try
               //if ENOperativeObjectObj.department = nil then ENOperativeObjectObj.department := ENDepartment.Create();
               //ENOperativeObjectObj.department.code := StrToInt(GetReturnValue(sgENDepartment,0));
               //edtENDepartmentDepartmentName.Text:=GetReturnValue(sgENDepartment,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENDepartmentShow.Free;
   end;
}
end;



procedure TfrmENOperativeObjectEdit.spbContractNumberSelectClick(
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

   //f.conditionSQL := 'a.io_flag = ''S'' and a.agree_group_id in (205, 342, 319, 88, 201, 218, 303, 198, 50, 206, 338, 44)';
   f.conditionSQL := 'a.io_flag = ''S'' and a.agree_group_id in (' + AGREES_GROUPS_IDS + ')';

   frmFINServicesObjectShow := TfrmFINServicesObjectShow.Create(Application,fmNormal, f);
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