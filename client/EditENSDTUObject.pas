
unit EditENSDTUObject;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSDTUObjectController ;

type
  TfrmENSDTUObjectEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;
    lblBuhName : TLabel;
    edtBuhName: TEdit;
    lblInvNumber : TLabel;
    edtInvNumber: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TMemo;

  lblENSDTUObjectTypeObjectTypeName : TLabel;
  edtENSDTUObjectTypeObjectTypeName : TEdit;
  spbENSDTUObjectTypeObjectType : TSpeedButton;
  
  lblENElementElementName : TLabel;
  edtENElementElementName : TEdit;
  spbENElementElement : TSpeedButton;
  

  HTTPRIOENSDTUObject: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    spbOSSelect: TSpeedButton;
    lblEPRenName: TLabel;
    edtEPRenName: TEdit;
    spbEPRen: TSpeedButton;
    gbObjectType: TGroupBox;
    rdbOS: TRadioButton;
    rdbMaterials: TRadioButton;
    lblGeograph: TLabel;
    edtGeograph: TEdit;
    btnGeograph: TSpeedButton;
    btnGeographClear: TSpeedButton;
    HTTPRIOENGeographicDepartment: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENSDTUObjectTypeObjectTypeClick(Sender : TObject);
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
  frmENSDTUObjectEdit: TfrmENSDTUObjectEdit;
  ENSDTUObjectObj: ENSDTUObject;

implementation

uses
  ShowENSDTUObjectType
  ,ENSDTUObjectTypeController
  ,ShowENElement
  ,ENElementController
, ShowOStable, OSTableController, DMReportsUnit, ShowENEPRen, ShowTMatherial,
  TMaterialController, ShowENGeographicDepartment,
  ENGeographicDepartmentController, ENConsts;

{uses  
    EnergyproController, EnergyproController2, ENSDTUObjectController  ;
}
{$R *.dfm}



procedure TfrmENSDTUObjectEdit.FormShow(Sender: TObject);
var
  elementList : ENElementShortList;
  elementFilter : ENElementFilter;
  TempENGeographicDepartment: ENGeographicDepartmentControllerSoapPort;
  ENGeographicDepartmentObj : ENGeographicDepartment;
begin
  gbObjectType.Visible := (DialogState <> dsView);
  DisableControls([edtGeograph]);

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DisableControls([edtEPRenName, edtENElementElementName, edtENSDTUObjectTypeObjectTypeName, edtBuhName]);
    DenyBlankValues([
      edtName
      //,edtENElementElementName
      ,edtInvNumber
      ,edtENSDTUObjectTypeObjectTypeName
      ,edtEPRenName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ENSDTUObjectObj.element.geoDepartmentRef <> nil then
      if ENSDTUObjectObj.element.geoDepartmentRef.code <> LOW_INT then
       begin
          // geodept
            TempENGeographicDepartment := HTTPRIOENGeographicDepartment as ENGeographicDepartmentControllerSoapPort;
          try
            ENGeographicDepartmentObj := TempENGeographicDepartment.getObject( ENSDTUObjectObj.element.geoDepartmentRef.code );
            edtGeograph.Text := ENGeographicDepartmentObj.name;
          except
            on EConvertError do Exit;
          end;
       end;

    edtName.Text := ENSDTUObjectObj.name;
    edtBuhName.Text := ENSDTUObjectObj.buhName; 
    edtInvNumber.Text := ENSDTUObjectObj.invNumber;
    MakeMultiline(edtCommentGen.Lines, ENSDTUObjectObj.commentGen);

    edtENSDTUObjectTypeObjectTypeName.Text := ENSDTUObjectObj.objectType.name;
    //edtENElementElementName.Text := ENSDTUObjectObj.element.name;
    edtENElementElementName.Text := '';
    if ENSDTUObjectObj.element.elementInRef.code > Low(Integer) then
    begin
        elementFilter := ENElementFilter.Create;
        SetNullIntProps(elementFilter);
        SetNullXSProps(elementFilter);

        elementFilter.code := ENSDTUObjectObj.element.elementInRef.code;

        elementList := DMReports.searchElements(elementFilter, 0, -1,'','');
        if elementList.totalCount > 0 then
        begin
          edtENElementElementName.Text := elementList.list[0].objectName;
          //edtEPRenName.Text := elementList.list[0].renRefName;
        end;

        DisableControls([edtEPRenName, spbEPRen]);
    end;

    edtEPRenName.Text := ENSDTUObjectObj.element.renRef.name;

  end;

  if DialogState = dsView then
    DisableControls([spbOSSelect, spbEPRen, spbENSDTUObjectTypeObjectType, spbENElementElement , btnGeograph  , btnGeographClear ]);
end;



procedure TfrmENSDTUObjectEdit.btnGeographClearClick(Sender: TObject);
begin
   ENSDTUObjectObj.element.geoDepartmentRef.code := LOW_INT;
   edtGeograph.Text := '';

end;

procedure TfrmENSDTUObjectEdit.btnGeographClick(Sender: TObject);
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
                 ENSDTUObjectObj.element.geoDepartmentRef.code := selected.code;
                 edtGeograph.Text := selected.name;
            end;
          end;
   finally
      frmENGeographicDepartmentShow.Free;
   end;
end;

procedure TfrmENSDTUObjectEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSDTUObject: ENSDTUObjectControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
      //,edtENElementElementName
      ,edtInvNumber
      ,edtENSDTUObjectTypeObjectTypeName      
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin

    if ENSDTUObjectObj.element <> nil then
    begin
      if ENSDTUObjectObj.element.renRef <> nil then
      begin
         if ENSDTUObjectObj.element.renRef.code = low(Integer) then
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


    TempENSDTUObject := HTTPRIOENSDTUObject as ENSDTUObjectControllerSoapPort;


     ENSDTUObjectObj.name := edtName.Text;

     ENSDTUObjectObj.buhName := edtBuhName.Text; 

     ENSDTUObjectObj.invNumber := edtInvNumber.Text; 

     ENSDTUObjectObj.commentGen := edtCommentGen.Text; 

    if DialogState = dsInsert then
    begin
      ENSDTUObjectObj.code:=low(Integer);
      TempENSDTUObject.add(ENSDTUObjectObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSDTUObject.save(ENSDTUObjectObj);
    end;
  end;
end;


procedure TfrmENSDTUObjectEdit.spbENSDTUObjectTypeObjectTypeClick(Sender : TObject);
var 
   frmENSDTUObjectTypeShow: TfrmENSDTUObjectTypeShow;
begin
   frmENSDTUObjectTypeShow:=TfrmENSDTUObjectTypeShow.Create(Application,fmNormal);
   try
      with frmENSDTUObjectTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSDTUObjectObj.objectType = nil then ENSDTUObjectObj.objectType := ENSDTUObjectType.Create();
               ENSDTUObjectObj.objectType.code := StrToInt(GetReturnValue(sgENSDTUObjectType,0));
               edtENSDTUObjectTypeObjectTypeName.Text:=GetReturnValue(sgENSDTUObjectType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENSDTUObjectTypeShow.Free;
   end;
end;



procedure TfrmENSDTUObjectEdit.spbENElementElementClick(Sender : TObject);
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
               if ENSDTUObjectObj.element = nil then ENSDTUObjectObj.element := ENElement.Create();
               if ENSDTUObjectObj.element.elementInRef = nil then  ENSDTUObjectObj.element.elementInRef := ENElementRef.Create;
               ENSDTUObjectObj.element.elementInRef.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementElementName.Text:=GetReturnValue(sgENElement,1);

               edtEPRenName.Text:=GetReturnValue(sgENElement,2);

               elementIn := DMReports.getElementByCode(ENSDTUObjectObj.element.elementInRef.code);
               if elementIn <> nil then
                 if elementIn.renRef <> nil then
                 begin
                   if ENSDTUObjectObj.element.renRef = nil then ENSDTUObjectObj.element.renRef := EPRenRef.Create;
                   ENSDTUObjectObj.element.renRef.code := elementIn.renRef.code;
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



procedure TfrmENSDTUObjectEdit.spbOSSelectClick(Sender: TObject);
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
  else begin // Выбор из материалов
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
end;

procedure TfrmENSDTUObjectEdit.spbEPRenClick(Sender: TObject);
var
   frmEPRenShow: TfrmENEPRenShow;
begin
   frmEPRenShow:=TfrmENEPRenShow.Create(Application,fmNormal);
   try
      with frmEPRenShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSDTUObjectObj.element = nil then ENSDTUObjectObj.element := ENElement.Create();
               if ENSDTUObjectObj.element.renRef = nil then ENSDTUObjectObj.element.renRef := EPRenRef.Create();
               ENSDTUObjectObj.element.renRef.code := StrToInt(GetReturnValue(sgEPRen,0));
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