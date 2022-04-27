
unit EditENIzolationObject;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENIzolationObjectController ;

type
  TfrmENIzolationObjectEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;
    lblBuhName : TLabel;
    edtBuhName: TEdit;
    lblInvNumber : TLabel;
    edtInvNumber: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TMemo;

  lblENIzolationObjectTypeObjectTypeName : TLabel;
  edtENIzolationObjectTypeObjectTypeName : TEdit;
  spbENIzolationObjectTypeObjectType : TSpeedButton;
  edtENElementElementName : TEdit;
  spbENElementElement : TSpeedButton;
  

  HTTPRIOENIzolationObject: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    lblEPRenName: TLabel;
    edtEPRenName: TEdit;
    spbEPRen: TSpeedButton;
    spbOSSelect: TSpeedButton;
    lblENElementElementName: TLabel;
    lblGeograph: TLabel;
    edtGeograph: TEdit;
    btnGeograph: TSpeedButton;
    btnGeographClear: TSpeedButton;
    HTTPRIOENElement: THTTPRIO;
    HTTPRIOENGeographicDepartment: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENIzolationObjectTypeObjectTypeClick(Sender : TObject);
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
  frmENIzolationObjectEdit: TfrmENIzolationObjectEdit;
  ENIzolationObjectObj: ENIzolationObject;

implementation

uses
  ShowENIzolationObjectType
  ,ENIzolationObjectTypeController
  ,ShowENElement
  ,ENElementController
, ShowOStable, OSTableController, ShowENEPRen, DMReportsUnit,
  ShowENGeographicDepartment, ENGeographicDepartmentController, ENConsts;

{uses  
    EnergyproController, EnergyproController2, ENIzolationObjectController  ;
}
{$R *.dfm}



procedure TfrmENIzolationObjectEdit.FormShow(Sender: TObject);
var
 elementList : ENElementShortList;
 elementFilter : ENElementFilter;

  TempENGeographicDepartment: ENGeographicDepartmentControllerSoapPort;
  ENGeographicDepartmentObj : ENGeographicDepartment;

  eList : ENElementShortList;
  TempENElement: ENElementControllerSoapPort;
  eFilter : ENElementFilter;
begin

  DisableControls([edtGeograph , edtEPRenName, edtENElementElementName, edtENIzolationObjectTypeObjectTypeName, edtBuhName]);

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
       edtName
      ,edtInvNumber
      ,edtENIzolationObjectTypeObjectTypeName
      ,edtEPRenName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ENIzolationObjectObj.element.geoDepartmentRef <> nil then
      if ENIzolationObjectObj.element.geoDepartmentRef.code <> LOW_INT then
       begin
           // geodept
          TempENGeographicDepartment := HTTPRIOENGeographicDepartment as ENGeographicDepartmentControllerSoapPort;
        try
          ENGeographicDepartmentObj := TempENGeographicDepartment.getObject( ENIzolationObjectObj.element.geoDepartmentRef.code );
          edtGeograph.Text := ENGeographicDepartmentObj.name;
        except
          on EConvertError do Exit;
        end;
       end;

    edtName.Text := ENIzolationObjectObj.name; 
    edtBuhName.Text := ENIzolationObjectObj.buhName;
    edtInvNumber.Text := ENIzolationObjectObj.invNumber;
    MakeMultiline(edtCommentGen.Lines, ENIzolationObjectObj.commentGen);

    edtENIzolationObjectTypeObjectTypeName.Text := ENIzolationObjectObj.objectType.name;
    //edtENElementElementName.Text := ENIzolationObjectObj.element.name;

    edtENElementElementName.Text := '';
    if ENIzolationObjectObj.element.elementInRef.code > Low(Integer) then
    begin
        elementFilter := ENElementFilter.Create;
        SetNullIntProps(elementFilter);
        SetNullXSProps(elementFilter);

        elementFilter.code := ENIzolationObjectObj.element.elementInRef.code;

        elementList := DMReports.searchElements(elementFilter, 0, -1,'','');
        if elementList.totalCount > 0 then
           edtENElementElementName.Text := elementList.list[0].objectName;

        DisableControls([edtEPRenName, spbEPRen]);
        
    end;

    edtEPRenName.Text := ENIzolationObjectObj.element.renRef.name;

    if ENIzolationObjectObj.element <> nil then
           if (ENIzolationObjectObj.element.renRef <> nil ) then
         begin
          TempENElement :=  HTTPRIOENElement as ENElementControllerSoapPort;
           eFilter := ENElementFilter.Create;
           SetNullIntProps(eFilter);
           SetNullXSProps(eFilter);
           eFilter.code := ENIzolationObjectObj.element.code;
          eList := TempENElement.getScrollableFilteredList(eFilter,0,-1);
          edtEPRenName.Text :=  eList.list[0].renRefName;
         end
        else
          edtEPRenName.Text := ''
    else
       edtEPRenName.Text := '';
  end;

  if DialogState = dsView then
    DisableControls([ btnGeographClear , btnGeograph , spbOSSelect, spbEPRen, spbENIzolationObjectTypeObjectType, spbENElementElement]);

end;



procedure TfrmENIzolationObjectEdit.btnGeographClearClick(Sender: TObject);
begin
   ENIzolationObjectObj.element.geoDepartmentRef.code := LOW_INT;
   edtGeograph.Text := '';

end;

procedure TfrmENIzolationObjectEdit.btnGeographClick(Sender: TObject);
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
                 ENIzolationObjectObj.element.geoDepartmentRef.code := selected.code;
                 edtGeograph.Text := selected.name;
            end;
          end;
   finally
      frmENGeographicDepartmentShow.Free;
   end;
end;

procedure TfrmENIzolationObjectEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENIzolationObject: ENIzolationObjectControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
      ,edtENIzolationObjectTypeObjectTypeName
      ,edtInvNumber
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin

    if ENIzolationObjectObj.element <> nil then
    begin
      if ENIzolationObjectObj.element.renRef <> nil then
      begin
         if ENIzolationObjectObj.element.renRef.code = low(Integer) then
         begin
            Application.MessageBox(PChar('Оберіть підрозділ !'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
            if edtEPRenName.CanFocus then edtEPRenName.SetFocus;
            Action:=caNone;
            Exit;
         end;
      end
      else begin
            Application.MessageBox(PChar('Оберіть підрозділ !!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
            if edtEPRenName.CanFocus then edtEPRenName.SetFocus;
            Action:=caNone;
            Exit;
      end;
    end
    else begin
      Application.MessageBox(PChar('Оберіть підрозділ !!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
      if edtEPRenName.CanFocus then edtEPRenName.SetFocus;
      Action:=caNone;
      Exit;
    end;

    TempENIzolationObject := HTTPRIOENIzolationObject as ENIzolationObjectControllerSoapPort;


     ENIzolationObjectObj.name := edtName.Text;

     ENIzolationObjectObj.buhName := edtBuhName.Text; 

     ENIzolationObjectObj.invNumber := edtInvNumber.Text; 

     ENIzolationObjectObj.commentGen := edtCommentGen.Text; 

    if DialogState = dsInsert then
    begin
      ENIzolationObjectObj.code:=low(Integer);
      TempENIzolationObject.add(ENIzolationObjectObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENIzolationObject.save(ENIzolationObjectObj);
    end;
  end;
end;


procedure TfrmENIzolationObjectEdit.spbENIzolationObjectTypeObjectTypeClick(Sender : TObject);
var 
   frmENIzolationObjectTypeShow: TfrmENIzolationObjectTypeShow;
begin
   frmENIzolationObjectTypeShow:=TfrmENIzolationObjectTypeShow.Create(Application,fmNormal);
   try
      with frmENIzolationObjectTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENIzolationObjectObj.objectType = nil then ENIzolationObjectObj.objectType := ENIzolationObjectType.Create();
               ENIzolationObjectObj.objectType.code := StrToInt(GetReturnValue(sgENIzolationObjectType,0));
               edtENIzolationObjectTypeObjectTypeName.Text:=GetReturnValue(sgENIzolationObjectType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENIzolationObjectTypeShow.Free;
   end;
end;



procedure TfrmENIzolationObjectEdit.spbENElementElementClick(Sender : TObject);
var
   frmENElementShow: TfrmENElementShow;
   elementIn: ENElement;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENIzolationObjectObj.element = nil then ENIzolationObjectObj.element := ENElement.Create();
               if ENIzolationObjectObj.element.elementInRef = nil then  ENIzolationObjectObj.element.elementInRef := ENElementRef.Create;
               ENIzolationObjectObj.element.elementInRef.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementElementName.Text:=GetReturnValue(sgENElement,1);

               edtEPRenName.Text:=GetReturnValue(sgENElement,2);

               elementIn := DMReports.getElementByCode(ENIzolationObjectObj.element.elementInRef.code);
               if elementIn <> nil then
                 if elementIn.renRef <> nil then
                 begin
                   if ENIzolationObjectObj.element.renRef = nil then ENIzolationObjectObj.element.renRef := EPRenRef.Create;
                   ENIzolationObjectObj.element.renRef.code := elementIn.renRef.code;
                 end;

               DisableControls([edtEPRenName, spbEPRen]);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
{
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENIzolationObjectObj.element = nil then ENIzolationObjectObj.element := ENElement.Create();
               ENIzolationObjectObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
}
end;



procedure TfrmENIzolationObjectEdit.spbOSSelectClick(Sender: TObject);
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
end;

procedure TfrmENIzolationObjectEdit.spbEPRenClick(Sender: TObject);
var 
   frmEPRenShow: TfrmENEPRenShow;
begin
   frmEPRenShow:=TfrmENEPRenShow.Create(Application,fmNormal);
   try
      with frmEPRenShow do
        if ShowModal = mrOk then
        begin
            try
               if ENIzolationObjectObj.element = nil then ENIzolationObjectObj.element := ENElement.Create();
               if ENIzolationObjectObj.element.renRef = nil then ENIzolationObjectObj.element.renRef := EPRenRef.Create();
               ENIzolationObjectObj.element.renRef.code := StrToInt(GetReturnValue(sgEPRen,0));
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