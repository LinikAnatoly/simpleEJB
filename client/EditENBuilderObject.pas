
unit EditENBuilderObject;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENBuilderObjectController ;

type
  TfrmENBuilderObjectEdit = class(TDialogForm)

    lblInvNumber : TLabel;
    edtInvNumber: TEdit;
    lblName : TLabel;
    edtName: TEdit;
    lblBuhName : TLabel;
    edtBuhName: TEdit;
    lblYearBuild : TLabel;
    edtYearBuild: TEdit;
    lblYearWorkingStart : TLabel;
    edtYearWorkingStart: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TMemo;

  lblENBuilderObjectTypeObjectTypeName : TLabel;
  edtENBuilderObjectTypeObjectTypeName : TEdit;
  spbENBuilderObjectTypeObjectType : TSpeedButton;
  

  HTTPRIOENBuilderObject: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    spbInvNumber: TSpeedButton;
    lblDateGen: TLabel;
    edtDateGen: TDateTimePicker;
    spbEPRen: TSpeedButton;
    edtEPRenName: TEdit;
    lblEPRenName: TLabel;
    isMoreObjects: TCheckBox;
    edtGeograph: TEdit;
    btnGeographClear: TSpeedButton;
    btnGeograph: TSpeedButton;
    lblGeograph: TLabel;
    HTTPRIOENGeographicDepartment: THTTPRIO;
    HTTPRIOENElement: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENBuilderObjectTypeObjectTypeClick(Sender : TObject);
    procedure spbInvNumberClick(Sender: TObject);
    procedure spbEPRenClick(Sender: TObject);
    procedure btnGeographClick(Sender: TObject);
    procedure btnGeographClearClick(Sender: TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENBuilderObjectEdit: TfrmENBuilderObjectEdit;
  ENBuilderObjectObj: ENBuilderObject;

implementation

uses
  ShowENBuilderObjectType
  ,ENBuilderObjectTypeController
  ,ShowENElement
  ,ENElementController
, ShowOStable, OSTableController, ShowENEPRen, ShowENGeographicDepartment,
  ENGeographicDepartmentController, ENConsts;

{uses  
    EnergyproController, EnergyproController2, ENBuilderObjectController  ;
}
{$R *.dfm}



procedure TfrmENBuilderObjectEdit.FormShow(Sender: TObject);
var
  TempENGeographicDepartment: ENGeographicDepartmentControllerSoapPort;
  ENGeographicDepartmentObj : ENGeographicDepartment;

  eList : ENElementShortList;
  TempENElement: ENElementControllerSoapPort;
  eFilter : ENElementFilter;
begin
  DisableControls([edtGeograph]);
  SetIntStyle([edtYearBuild, edtYearWorkingStart]);

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtInvNumber,
      edtName,
      edtENBuilderObjectTypeObjectTypeName,
      edtEPRenName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

   if ENBuilderObjectObj.element.geoDepartmentRef <> nil then
      if ENBuilderObjectObj.element.geoDepartmentRef.code <> LOW_INT then
       begin
          // geodept
            TempENGeographicDepartment := HTTPRIOENGeographicDepartment as ENGeographicDepartmentControllerSoapPort;
          try
            ENGeographicDepartmentObj := TempENGeographicDepartment.getObject( ENBuilderObjectObj.element.geoDepartmentRef.code );
            edtGeograph.Text := ENGeographicDepartmentObj.name;
          except
            on EConvertError do Exit;
          end;
       end;

    edtInvNumber.Text := ENBuilderObjectObj.invNumber;
    edtName.Text := ENBuilderObjectObj.name; 
    edtBuhName.Text := ENBuilderObjectObj.buhName; 
    if ( ENBuilderObjectObj.yearBuild <> Low(Integer) ) then
       edtYearBuild.Text := IntToStr(ENBuilderObjectObj.yearBuild)
    else
       edtYearBuild.Text := '';
    if ( ENBuilderObjectObj.yearWorkingStart <> Low(Integer) ) then
       edtYearWorkingStart.Text := IntToStr(ENBuilderObjectObj.yearWorkingStart)
    else
       edtYearWorkingStart.Text := '';
    MakeMultiline(edtCommentGen.Lines, ENBuilderObjectObj.commentGen);
      if ENBuilderObjectObj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(ENBuilderObjectObj.dateGen.Year,ENBuilderObjectObj.dateGen.Month,ENBuilderObjectObj.dateGen.Day);
        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;

    //edtUserGen.Text := ENBuilderObjectObj.userGen; 

    edtENBuilderObjectTypeObjectTypeName.Text := ENBuilderObjectObj.objectType.name;
    //edtENElementElementName.Text := ENBuilderObjectObj.element.name;

    edtEPRenName.Text := ENBuilderObjectObj.element.renRef.name;

    if ENBuilderObjectObj.element <> nil then
           if (ENBuilderObjectObj.element.renRef <> nil ) then
         begin
          TempENElement :=  HTTPRIOENElement as ENElementControllerSoapPort;
           eFilter := ENElementFilter.Create;
           SetNullIntProps(eFilter);
           SetNullXSProps(eFilter);
           eFilter.code := ENBuilderObjectObj.element.code;
          eList := TempENElement.getScrollableFilteredList(eFilter,0,-1);
          edtEPRenName.Text :=  eList.list[0].renRefName;
         end
        else
          edtEPRenName.Text := ''
    else
       edtEPRenName.Text := '';


  end;


end;



procedure TfrmENBuilderObjectEdit.btnGeographClearClick(Sender: TObject);
begin
   ENBuilderObjectObj.element.geoDepartmentRef.code := LOW_INT;
   edtGeograph.Text := '';

end;

procedure TfrmENBuilderObjectEdit.btnGeographClick(Sender: TObject);
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
                 ENBuilderObjectObj.element.geoDepartmentRef.code := selected.code;
                 edtGeograph.Text := selected.name;
            end;
          end;
   finally
      frmENGeographicDepartmentShow.Free;
   end;
end;

procedure TfrmENBuilderObjectEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENBuilderObject: ENBuilderObjectControllerSoapPort;
    BuilderObjectFilter: ENBuilderObjectFilter;
    BuilderObjectList: ENBuilderObjectShortList;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      //edtInvNumber,
      edtName,
      edtENBuilderObjectTypeObjectTypeName,
      edtEPRenName      
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENBuilderObject := HTTPRIOENBuilderObject as ENBuilderObjectControllerSoapPort;

    ///////
    if ((edtInvNumber.Text <> '') and (DialogState = dsInsert)) then
    begin
      BuilderObjectFilter := ENBuilderObjectFilter.Create;
      try
        SetNullIntProps(BuilderObjectFilter);
        SetNullXSProps(BuilderObjectFilter);

        BuilderObjectFilter.invNumber := Trim(edtInvNumber.Text);
        //TransportRealFilter.name := Trim(edtName.Text);
        if DialogState = dsEdit then
          BuilderObjectFilter.conditionSQL := 'code <> ' + IntToStr(BuilderObjectFilter.code);

        BuilderObjectList := TempENBuilderObject.getScrollableFilteredList(BuilderObjectFilter, 0, -1);
        if BuilderObjectList.totalCount > 0 then
        begin
          Application.MessageBox(PChar('Объект с таким инвентарным номером уже существует (код: ' + IntToStr(BuilderObjectList.list[0].code) + ')!'), PChar('Внимание !'), MB_ICONWARNING+MB_OK);
          Action := caNone;
          Exit;
        end;
      finally
        BuilderObjectFilter.Free;
      end;
    end;
    ///////


     ENBuilderObjectObj.invNumber := edtInvNumber.Text; 

     ENBuilderObjectObj.name := edtName.Text; 

     ENBuilderObjectObj.buhName := edtBuhName.Text; 

     if ( edtYearBuild.Text <> '' ) then
       ENBuilderObjectObj.yearBuild := StrToInt(edtYearBuild.Text)
     else
       ENBuilderObjectObj.yearBuild := Low(Integer) ;

     if ( edtYearWorkingStart.Text <> '' ) then
       ENBuilderObjectObj.yearWorkingStart := StrToInt(edtYearWorkingStart.Text)
     else
       ENBuilderObjectObj.yearWorkingStart := Low(Integer) ;

     ENBuilderObjectObj.commentGen := edtCommentGen.Text; 

     if edtdateGen.checked then
     begin 
       if ENBuilderObjectObj.dateGen = nil then
          ENBuilderObjectObj.dateGen := TXSDate.Create;
       ENBuilderObjectObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end
     else
       ENBuilderObjectObj.dateGen := nil;

     //ENBuilderObjectObj.userGen := edtUserGen.Text; 

    if DialogState = dsInsert then
    begin
      ENBuilderObjectObj.code:=low(Integer);
      TempENBuilderObject.add(ENBuilderObjectObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENBuilderObject.save(ENBuilderObjectObj);
    end;
  end;
end;


procedure TfrmENBuilderObjectEdit.spbENBuilderObjectTypeObjectTypeClick(Sender : TObject);
var 
   frmENBuilderObjectTypeShow: TfrmENBuilderObjectTypeShow;
begin
   frmENBuilderObjectTypeShow:=TfrmENBuilderObjectTypeShow.Create(Application,fmNormal);
   try
      with frmENBuilderObjectTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENBuilderObjectObj.objectType = nil then ENBuilderObjectObj.objectType := ENBuilderObjectType.Create();
               ENBuilderObjectObj.objectType.code := StrToInt(GetReturnValue(sgENBuilderObjectType,0));
               edtENBuilderObjectTypeObjectTypeName.Text:=GetReturnValue(sgENBuilderObjectType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENBuilderObjectTypeShow.Free;
   end;
end;

procedure TfrmENBuilderObjectEdit.spbInvNumberClick(Sender: TObject);
var
  frmOSTableShow: TfrmOSTableShow;
  f: OStableFilter;
begin
  f := OStableFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);

  // строители асфальтируют кусок Кабельной линии ;) ... нужен обьект из ФК !!
  if isMoreObjects.Checked then
    f.conditionSQL := ' OSTABLE.KOD_VID in (3,11) ' // условие кабельщиков ... мож еще ЧТО ;)
  else
    f.conditionSQL := ' OSTABLE.KOD_VID in (1) '; // Здания (11) ...



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
          if edtName.Text = '' then edtName.Text := edtBuhName.Text;

          DisableControls([edtInvNumber, edtBuhName]);
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmOSTableShow.Free;
  end;
end;

procedure TfrmENBuilderObjectEdit.spbEPRenClick(Sender: TObject);
var 
   frmEPRenShow: TfrmENEPRenShow;
begin
   frmEPRenShow:=TfrmENEPRenShow.Create(Application,fmNormal);
   try
      with frmEPRenShow do
        if ShowModal = mrOk then
        begin
            try
               if ENBuilderObjectObj.element = nil then ENBuilderObjectObj.element := ENElement.Create();
               if ENBuilderObjectObj.element.renRef = nil then ENBuilderObjectObj.element.renRef := EPRenRef.Create();
               ENBuilderObjectObj.element.renRef.code := StrToInt(GetReturnValue(sgEPRen,0));
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
