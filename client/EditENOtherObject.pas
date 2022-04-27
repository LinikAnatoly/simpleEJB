
unit EditENOtherObject;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENOtherObjectController ;

type
  TfrmENOtherObjectEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TMemo;
    lblBuhName : TLabel;
    edtBuhName: TEdit;
    edtInvNumber: TEdit;
    lblUserGen : TLabel;
    edtUserGen: TEdit;
    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;

  lblENElementElementName : TLabel;
  edtENElementElementName : TEdit;
  spbENElementElement : TSpeedButton;
  

  HTTPRIOENOtherObject: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    spbOSSelect: TSpeedButton;
    gbObjectType: TGroupBox;
    rdbOS: TRadioButton;
    rdbMaterials: TRadioButton;
    Label1: TLabel;
    lblEPRenName: TLabel;
    edtEPRenName: TEdit;
    spbEPRen: TSpeedButton;
    lblBuildNumber: TLabel;
    edtBuildNumber: TEdit;
    lblElementNameIn: TLabel;
    edtElementNameIn: TEdit;
    lblGeograph: TLabel;
    edtGeograph: TEdit;
    btnGeograph: TSpeedButton;
    btnGeographClear: TSpeedButton;
    HTTPRIOENGeographicDepartment: THTTPRIO;
    HTTPRIOENElement: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENElementElementClick(Sender : TObject);
    procedure spbOSSelectClick(Sender: TObject);
    procedure spbEPRenClick(Sender: TObject);
    procedure btnGeographClick(Sender: TObject);
    procedure btnGeographClearClick(Sender: TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENOtherObjectEdit: TfrmENOtherObjectEdit;
  ENOtherObjectObj: ENOtherObject;

implementation

uses
  ShowENElement
  ,ENElementController
, ShowOStable, OSTableController, ShowTMatherial, TmaterialController,
  ShowENEPRen, ENConsts, DMReportsUnit, ShowENGeographicDepartment,
  ENGeographicDepartmentController;

{uses  
    EnergyproController, EnergyproController2, ENOtherObjectController  ;
}
{$R *.dfm}



procedure TfrmENOtherObjectEdit.FormShow(Sender: TObject);
var
elShortList : ENElementShortList;
elFilter : ENElementFilter;

  TempENGeographicDepartment: ENGeographicDepartmentControllerSoapPort;
  ENGeographicDepartmentObj : ENGeographicDepartment;

  eList : ENElementShortList;
  TempENElement: ENElementControllerSoapPort;
  eFilter : ENElementFilter;

begin

  HideControls([lblBuildNumber, edtBuildNumber, lblEPRenName, edtEPRenName, spbEPRen], not (ENOtherObjectObj.typeRef.code in [ABSTRACT_TYPE_EQUIPMENT, ABSTRACT_TYPE_EQUIPMENT_REPAIR]));

  HideControls([lblElementNameIn, edtElementNameIn], ((not (ENOtherObjectObj.typeRef.code in [ABSTRACT_TYPE_EQUIPMENT_REPAIR])) or (DialogState = dsInsert)));
  DisableControls([edtElementNameIn , edtGeograph ]);

  if DialogState = dsView then
  begin
//     DisableControls([
    DisableControls([
      edtENElementElementName
      ,spbENElementElement
      ,btnGeograph
      ,btnGeographClear
       ]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      , edtBuhName
      , edtInvNumber
     ]);

     DenyBlankValues([edtEPRenName, edtBuildNumber], (ENOtherObjectObj.typeRef.code in [ABSTRACT_TYPE_EQUIPMENT, ABSTRACT_TYPE_EQUIPMENT_REPAIR]));
   end;

  DisableControls([edtBuhName, edtCode, edtEPRenName]);

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    if ENOtherObjectObj.element.geoDepartmentRef <> nil then
      if ENOtherObjectObj.element.geoDepartmentRef.code <> LOW_INT then
       begin
        // geodept
          TempENGeographicDepartment := HTTPRIOENGeographicDepartment as ENGeographicDepartmentControllerSoapPort;
        try
          ENGeographicDepartmentObj := TempENGeographicDepartment.getObject( ENOtherObjectObj.element.geoDepartmentRef.code );
          edtGeograph.Text := ENGeographicDepartmentObj.name;
        except
          on EConvertError do Exit;
        end;
       end;

    edtCode.Text := IntToStr(ENOtherObjectObj.code);
    edtName.Text := ENOtherObjectObj.name;
    MakeMultiline(edtCommentGen.Lines, ENOtherObjectObj.commentGen);
    edtBuhName.Text := ENOtherObjectObj.buhName; 
    edtInvNumber.Text := ENOtherObjectObj.invNumber;

    edtBuildNumber.Text := ENOtherObjectObj.buildNumber;


    edtUserGen.Text := ENOtherObjectObj.userGen;

    if ENOtherObjectObj.element <> nil then
           if (ENOtherObjectObj.element.renRef <> nil ) then
         begin
          TempENElement :=  HTTPRIOENElement as ENElementControllerSoapPort;
           eFilter := ENElementFilter.Create;
           SetNullIntProps(eFilter);
           SetNullXSProps(eFilter);
           eFilter.code := ENOtherObjectObj.element.code;
          eList := TempENElement.getScrollableFilteredList(eFilter,0,-1);
          edtEPRenName.Text :=  eList.list[0].renRefName;
         end
        else
          edtEPRenName.Text := ''
    else
       edtEPRenName.Text := '';

      if ENOtherObjectObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENOtherObjectObj.dateEdit.Year,ENOtherObjectObj.dateEdit.Month,ENOtherObjectObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;

      if ENOtherObjectObj.typeRef.code in [ABSTRACT_TYPE_EQUIPMENT, ABSTRACT_TYPE_EQUIPMENT_REPAIR]  then
      begin
        edtEPRenName.Text := ENOtherObjectObj.element.renRef.name;

        if (ENOtherObjectObj.typeRef.code in [ABSTRACT_TYPE_EQUIPMENT_REPAIR]) and (ENOtherObjectObj.element.elementInRef.code > LOW_INT)  then
        begin
          elFilter := ENElementFilter.Create;
          SetNullIntProps(elFilter);
          SetNullXSProps(elFilter);
          elFilter.code := ENOtherObjectObj.element.elementInRef.code;
          elShortList := DMReports.searchElements(elFilter, 0, -1, '', '', '');
          if  elShortList.totalCount > 0 then
            edtElementNameIn.Text :=  elShortList.list[0].objectName + ' , інв № ' + elShortList.list[0].objectInvNumber; 

        end;

      end;
      
   // edtENElementElementName.Text := ENOtherObjectObj.element.name;

  end;
end;



procedure TfrmENOtherObjectEdit.btnGeographClearClick(Sender: TObject);
begin
   ENOtherObjectObj.element.geoDepartmentRef.code := LOW_INT;
   edtGeograph.Text := '';

end;

procedure TfrmENOtherObjectEdit.btnGeographClick(Sender: TObject);
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
                 ENOtherObjectObj.element.geoDepartmentRef.code := selected.code;
                 edtGeograph.Text := selected.name;
            end;
          end;
   finally
      frmENGeographicDepartmentShow.Free;
   end;
end;

procedure TfrmENOtherObjectEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENOtherObject: ENOtherObjectControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
      , edtBuhName
      , edtInvNumber
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin

    if (ENOtherObjectObj.typeRef.code in [ABSTRACT_TYPE_EQUIPMENT, ABSTRACT_TYPE_EQUIPMENT_REPAIR]) then
    begin
      if not NoBlankValues([
          edtEPRenName
          , edtBuildNumber
         ])  then
      begin
          Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
          Action:=caNone;
          Exit;
      end;
    end;

    TempENOtherObject := HTTPRIOENOtherObject as ENOtherObjectControllerSoapPort;


     ENOtherObjectObj.name := edtName.Text; 

     ENOtherObjectObj.commentGen := edtCommentGen.Text; 

     ENOtherObjectObj.buhName := edtBuhName.Text; 

     ENOtherObjectObj.invNumber := edtInvNumber.Text; 

     ENOtherObjectObj.buildNumber := edtBuildNumber.Text;
     
     ENOtherObjectObj.userGen := edtUserGen.Text; 

     if edtdateEdit.checked then
     begin 
       if ENOtherObjectObj.dateEdit = nil then
          ENOtherObjectObj.dateEdit := TXSDate.Create;
       ENOtherObjectObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENOtherObjectObj.dateEdit := nil;

    if DialogState = dsInsert then
    begin
      ENOtherObjectObj.code:=low(Integer);
      TempENOtherObject.add(ENOtherObjectObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENOtherObject.save(ENOtherObjectObj);
    end;
  end;
end;


procedure TfrmENOtherObjectEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENOtherObjectObj.element = nil then ENOtherObjectObj.element := ENElement.Create();
               ENOtherObjectObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;



procedure TfrmENOtherObjectEdit.spbOSSelectClick(Sender: TObject);
var
  frmOSTableShow: TfrmOSTableShow;
  f: OStableFilter;

  frmTMatherialShow: TfrmTMatherialShow;
  fMaterial: TMaterialFilter;
begin
  if rdbOS.Checked then // Выбор из основных
  begin
    f := OStableFilter.Create;
    SetNullIntProps(f);
    SetNullXSProps(f);
    f.conditionSQL := ' OSTABLE.KOD_VID in (1, 2, 3, 11, 13, 15, 24, 38) '; // подстанции как СИЛ.МАШИНЫ И ОБОРУД НЕ АВТОМ (11) ...

    if length(edtInvNumber.Text) > 0 then
      f.kod_inv := '*' + edtInvNumber.Text + '*';

    f.orderBySQL :=  'OSTABLE.STR_NAME';

    frmOSTableShow:=TfrmOSTableShow.Create(Application,fmNormal,f);
    //frmOSTableShow.SendType := 444; /// для энерго ....
    try
      with frmOSTableShow do
        if ShowModal = mrOk then
        begin
          try
            //TKElementToFinCollectionObj.fincode := StrToInt(GetReturnValue(sgOSTable,0));
            edtInvNumber.Text :=  GetReturnValue(sgOSTable,2);
            edtBuhName.Text := GetReturnValue(sgOSTable,1);
            DisableControls([edtInvNumber, edtBuhName]);
          except
            on EConvertError do Exit;
          end;
        end;
    finally
      frmOSTableShow.Free;
    end;
  end
  else
  begin // Выбор из материалов
    fMaterial := TMaterialFilter.Create;
    SetNullIntProps(fMaterial);
    SetNullXSProps(fMaterial);

    if length(edtInvNumber.Text) > 0 then
      fMaterial.nn := '*' + edtInvNumber.Text + '*';

    fMaterial.conditionSQL := 'TMATHERIAL.STATUS = ''A''';
    fMaterial.orderBySQL :=  'TMATHERIAL.NAME';

    frmTMatherialShow := TfrmTMatherialShow.Create(Application, fmNormal, fMaterial);
    try
      with frmTMatherialShow do
        if ShowModal = mrOk then
        begin
          try
            edtInvNumber.Text := GetReturnValue(sgTMatherial,3);
            edtBuhName.Text := GetReturnValue(sgTMatherial,1);
            DisableControls([edtInvNumber, edtBuhName]);
          except
            on EConvertError do Exit;
          end;
        end;
    finally
      frmTMatherialShow.Free;
    end;
  end;
{
var
frmOSTableShow: TfrmOSTableShow;
f : OStableFilter;
begin

     f := OStableFilter.Create;
     SetNullIntProps(f);
     SetNullXSProps(f);
     // AS 01.04.2010 ... для обьектов РЗА и СПС могут быть и здания :))) ... типа 00377 ...
     // 1 - здания ;)
     // Решетняк и зам нач. РЗА
     f.conditionSQL := ' OSTABLE.KOD_VID in (11,24,1) '; // подстанции как СИЛ.МАШИНЫ И ОБОРУД НЕ АВТОМ

     if length(edtInvNumber.Text) > 0 then
       f.kod_inv := '*' + edtInvNumber.Text + '*';

     f.orderBySQL :=  'OSTABLE.STR_NAME';

   frmOSTableShow:=TfrmOSTableShow.Create(Application,fmNormal,f);
   //frmOSTableShow.SendType := 444; /// для энерго ....
   try
      with frmOSTableShow do
        if ShowModal = mrOk then
        begin
            try
               //TKElementToFinCollectionObj.fincode := StrToInt(GetReturnValue(sgOSTable,0));
               edtInvNumber.Text :=  GetReturnValue(sgOSTable,2);
               edtBuhName.Text := GetReturnValue(sgOSTable,1);

               DisableControls([edtInvNumber, edtBuhName]);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmOSTableShow.Free;
   end;
}   
end;

procedure TfrmENOtherObjectEdit.spbEPRenClick(Sender: TObject);
var
   frmEPRenShow: TfrmENEPRenShow;
begin
   frmEPRenShow:=TfrmENEPRenShow.Create(Application,fmNormal);
   try
      with frmEPRenShow do
        if ShowModal = mrOk then
        begin
            try
               if ENOtherObjectObj.element = nil then ENOtherObjectObj.element := ENElement.Create();
               if ENOtherObjectObj.element.renRef = nil then ENOtherObjectObj.element.renRef := EPRenRef.Create();
               ENOtherObjectObj.element.renRef.code := StrToInt(GetReturnValue(sgEPRen,0));
               edtEPRenName.Text:=GetReturnValue(sgEPRen,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmEPRenShow.Free;
   end;
end;

end.
