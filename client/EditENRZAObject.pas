
unit EditENRZAObject;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENRZAObjectController ;

type
  TfrmENRZAObjectEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;
    lblBuhName : TLabel;
    edtBuhName: TEdit;
    lblInvNumber : TLabel;
    edtInvNumber: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TMemo;

  lblENRZAObjectTypeObjectTypeName : TLabel;
  edtENRZAObjectTypeObjectTypeName : TEdit;
  spbENRZAObjectTypeObjectType : TSpeedButton;
  
  lblENElementElementName : TLabel;
  edtENElementElementName : TEdit;
  spbENElementElement : TSpeedButton;
  

  HTTPRIOENRZAObject: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    spbOSSelect: TSpeedButton;
    lblEPRenName: TLabel;
    edtEPRenName: TEdit;
    spbEPRen: TSpeedButton;
    lblGeograph: TLabel;
    edtGeograph: TEdit;
    btnGeograph: TSpeedButton;
    btnGeographClear: TSpeedButton;
    HTTPRIOENGeographicDepartment: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENRZAObjectTypeObjectTypeClick(Sender : TObject);
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
  frmENRZAObjectEdit: TfrmENRZAObjectEdit;
  ENRZAObjectObj: ENRZAObject;

implementation

uses
  ShowENRZAObjectType
  ,ENRZAObjectTypeController
  ,ShowENElement
  ,ENElementController
, ShowOStable, OSTableController, DMReportsUnit, ShowENEPRen,
  ShowENGeographicDepartment, ENGeographicDepartmentController, ENConsts;

{uses  
    EnergyproController, EnergyproController2, ENRZAObjectController  ;
}
{$R *.dfm}



procedure TfrmENRZAObjectEdit.FormShow(Sender: TObject);
var
  elementList : ENElementShortList;
  elementFilter : ENElementFilter;
  TempENGeographicDepartment: ENGeographicDepartmentControllerSoapPort;
  ENGeographicDepartmentObj : ENGeographicDepartment;
begin

    DisableControls([edtEPRenName, edtENElementElementName, edtENRZAObjectTypeObjectTypeName, edtBuhName , edtGeograph ]);

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      //,edtENElementElementName
      ,edtInvNumber
      ,edtENRZAObjectTypeObjectTypeName
      ,edtEPRenName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ENRZAObjectObj.element.geoDepartmentRef <> nil then
      if ENRZAObjectObj.element.geoDepartmentRef.code <> LOW_INT then
       begin
        // geodept
          TempENGeographicDepartment := HTTPRIOENGeographicDepartment as ENGeographicDepartmentControllerSoapPort;
        try
          ENGeographicDepartmentObj := TempENGeographicDepartment.getObject( ENRZAObjectObj.element.geoDepartmentRef.code );
          edtGeograph.Text := ENGeographicDepartmentObj.name;
        except
          on EConvertError do Exit;
        end;
       end;

    edtName.Text := ENRZAObjectObj.name;
    edtBuhName.Text := ENRZAObjectObj.buhName; 
    edtInvNumber.Text := ENRZAObjectObj.invNumber;
    MakeMultiline(edtCommentGen.Lines, ENRZAObjectObj.commentGen);

    edtENRZAObjectTypeObjectTypeName.Text := ENRZAObjectObj.objectType.name;
    //edtENElementElementName.Text := ENRZAObjectObj.element.name;

    edtENElementElementName.Text := '';
    if ENRZAObjectObj.element.elementInRef.code > Low(Integer) then
    begin
        elementFilter := ENElementFilter.Create;
        SetNullIntProps(elementFilter);
        SetNullXSProps(elementFilter);

        elementFilter.code := ENRZAObjectObj.element.elementInRef.code;

        elementList := DMReports.searchElements(elementFilter, 0, -1,'','');
        if elementList.totalCount > 0 then
           edtENElementElementName.Text := elementList.list[0].objectName;

        DisableControls([edtEPRenName, spbEPRen]);
        
    end;

    edtEPRenName.Text := ENRZAObjectObj.element.renRef.name;

  end;

  if DialogState = dsView then
    DisableControls([spbOSSelect, spbEPRen, spbENRZAObjectTypeObjectType, spbENElementElement , btnGeograph , btnGeographClear ]);

end;



procedure TfrmENRZAObjectEdit.btnGeographClearClick(Sender: TObject);
begin
   ENRZAObjectObj.element.geoDepartmentRef.code := LOW_INT;
   edtGeograph.Text := '';

end;

procedure TfrmENRZAObjectEdit.btnGeographClick(Sender: TObject);
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
                 ENRZAObjectObj.element.geoDepartmentRef.code := selected.code;
                 edtGeograph.Text := selected.name;
            end;
          end;
   finally
      frmENGeographicDepartmentShow.Free;
   end;
end;

procedure TfrmENRZAObjectEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENRZAObject: ENRZAObjectControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
      //,edtENElementElementName
      ,edtENRZAObjectTypeObjectTypeName
      ,edtInvNumber
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin

    if ENRZAObjectObj.element <> nil then
    begin
      if ENRZAObjectObj.element.renRef <> nil then
      begin
         if ENRZAObjectObj.element.renRef.code = low(Integer) then
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

    TempENRZAObject := HTTPRIOENRZAObject as ENRZAObjectControllerSoapPort;


     ENRZAObjectObj.name := edtName.Text;

     ENRZAObjectObj.buhName := edtBuhName.Text; 

     ENRZAObjectObj.invNumber := edtInvNumber.Text; 

     ENRZAObjectObj.commentGen := edtCommentGen.Text; 

    if DialogState = dsInsert then
    begin
      ENRZAObjectObj.code:=low(Integer);
      TempENRZAObject.add(ENRZAObjectObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENRZAObject.save(ENRZAObjectObj);
    end;
  end;
end;


procedure TfrmENRZAObjectEdit.spbENRZAObjectTypeObjectTypeClick(Sender : TObject);
var 
   frmENRZAObjectTypeShow: TfrmENRZAObjectTypeShow;
begin
   frmENRZAObjectTypeShow:=TfrmENRZAObjectTypeShow.Create(Application,fmNormal);
   try
      with frmENRZAObjectTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENRZAObjectObj.objectType = nil then ENRZAObjectObj.objectType := ENRZAObjectType.Create();
               ENRZAObjectObj.objectType.code := StrToInt(GetReturnValue(sgENRZAObjectType,0));
               edtENRZAObjectTypeObjectTypeName.Text:=GetReturnValue(sgENRZAObjectType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENRZAObjectTypeShow.Free;
   end;
end;



procedure TfrmENRZAObjectEdit.spbENElementElementClick(Sender : TObject);
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
               if ENRZAObjectObj.element = nil then ENRZAObjectObj.element := ENElement.Create();
               if ENRZAObjectObj.element.elementInRef = nil then  ENRZAObjectObj.element.elementInRef := ENElementRef.Create;
               ENRZAObjectObj.element.elementInRef.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementElementName.Text:=GetReturnValue(sgENElement,1);

               edtEPRenName.Text:=GetReturnValue(sgENElement,2);

               elementIn := DMReports.getElementByCode(ENRZAObjectObj.element.elementInRef.code);
               if elementIn <> nil then
                 if elementIn.renRef <> nil then
                 begin
                   if ENRZAObjectObj.element.renRef = nil then ENRZAObjectObj.element.renRef := EPRenRef.Create;
                   ENRZAObjectObj.element.renRef.code := elementIn.renRef.code;
                 end;

               DisableControls([edtEPRenName, spbEPRen]);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;



procedure TfrmENRZAObjectEdit.spbOSSelectClick(Sender: TObject);
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

procedure TfrmENRZAObjectEdit.spbEPRenClick(Sender: TObject);
var 
   frmEPRenShow: TfrmENEPRenShow;
begin
   frmEPRenShow:=TfrmENEPRenShow.Create(Application,fmNormal);
   try
      with frmEPRenShow do
        if ShowModal = mrOk then
        begin
            try
               if ENRZAObjectObj.element = nil then ENRZAObjectObj.element := ENElement.Create();
               if ENRZAObjectObj.element.renRef = nil then ENRZAObjectObj.element.renRef := EPRenRef.Create();
               ENRZAObjectObj.element.renRef.code := StrToInt(GetReturnValue(sgEPRen,0));
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